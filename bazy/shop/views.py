from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth.decorators import login_required, permission_required
from django.shortcuts import render
from django.core.serializers.json import DjangoJSONEncoder
from shop.models import Product, Order, AuthUser, Review
import json
from django.db import connection


@login_required
def index(request):
    products = Product.objects.filter()
    context = {
        "products": products
    }
    return render(request, "shop.html", context)

def purchase(request, product_id):
    u = AuthUser.objects.get(id = request.user.id)
    Order.objects.create(product_id=product_id, user=u)
    next = Product.objects.get(product_id = product_id)
    return HttpResponseRedirect(next.amazon_url)
def list(request, product_id):
    u = AuthUser.objects.get(id = request.user.id)
    product = Product.objects.get(product_id=product_id)
    product.listed = True
    product.save()
    next = request.POST.get('next', '/')
    return HttpResponseRedirect(next)

def review(request, order_id):
    order = Order.objects.get(order_id = order_id)
    rat = int(request.POST.get("rating"))
    rev_text = request.POST.get("review")
    rev = Review(order = order, rating = rat, review = rev_text)
    rev.save()
    next = request.POST.get('next', '/')
    return HttpResponseRedirect(next)


def month_recommendation(month:str):
    query_text = f"""
SELECT p.amazon_url, p.photo_url,p.name ,o.product, count(*) as purchases
From "order" as o
inner join public.product p on p.product_id = o.product
where to_char(timestamp, 'FMMonth') = '{month}'
group by p.name,p.photo_url,p.amazon_url, o.product
order by purchases DESC;
"""
    with connection.cursor() as cursor:
        cursor.execute(query_text)
        columns = [col[0] for col in cursor.description]
        data = [dict(zip(columns, row)) for row in cursor.fetchall()]

    # stringified_data = json.dumps(data, cls=DjangoJSONEncoder)
    return data

def recommendation():
    result = {
        "January": month_recommendation("January"),
        "February": month_recommendation("February"),
        "March": month_recommendation("March"),
        "April": month_recommendation("April"),
        "May": month_recommendation("May"),
        "June": month_recommendation("June"),
        "July": month_recommendation("July"),
        "August": month_recommendation("August"),
        "September": month_recommendation("September"),
        "October": month_recommendation("October"),
        "November": month_recommendation("November"),
        "December": month_recommendation("December"),
    }
    return result

def owner_panel(request):
    context = {
        "recommendation": recommendation(),
    }
    return render(request, "owner_panel.html", context)
def order_history(request):
    orders = Order.objects.raw('SELECT * FROM "order" WHERE order_id not in (Select public.review."order" from "review")')
    context = {
        "orders": orders,
    }
    return render(request, "order_history.html", context)

