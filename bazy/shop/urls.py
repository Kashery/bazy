from django.urls import path

from . import views

urlpatterns = [
    path("", views.index, name="index"),
    path("purchase/<uuid:product_id>", views.purchase, name="purchase"),
    path("owner_panel/", views.owner_panel, name="owner_panel"),
    path("order_history/", views.order_history, name="order_history"),
    path("owner_panel/list/<uuid:product_id>", views.list, name="list_product"),
    path("order_history/review/<uuid:order_id>", views.review, name="review_product")
]