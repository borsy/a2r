
from django.contrib import admin
from django.urls import path
from django.shortcuts import render
from django.contrib.auth.views import LoginView

import webshop.views as web

def index(request):
    return render(request, 'index.html')

urlpatterns = [
    path('admin/', admin.site.urls),
    path('register/', web.register),
    path('category/<str:category>', web.getProductsByCategory),
    path('categories/', web.getCategories),
    path('', web.index_view, name='index'),
    path('login/', web.login_req, name='login'),
    path('get-csrf-token/', web.get_csrf_token, name='get_csrf_token'),
    path('authenticated/', web.authenticated, name='authenticated'),
    path('logout/', web.logout_req, name='logout'),
    path('addcart/<int:item>', web.add_cart, name='add_cart'),
    path('getcart/', web.get_cart, name='add_cart'),
    path('removecart/<int:item>', web.remove_cart, name='remove_cart'),
    path('checkout/', web.create_order, name='order'),
    path('megrendelesek/', web.get_orders),
    path('megrendelesek/active', web.get_active_orders, name='active_orders'),
    path('megrendelesek/history', web.get_order_history, name='order_history'),
    path('orderdone/<int:item>', web.order_done, name='order_done'),
]