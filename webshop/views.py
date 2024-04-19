from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import requires_csrf_token, csrf_exempt
from django.contrib.auth.models import User
from django.utils.http import urlsafe_base64_encode

from .serializers import ProductSerializer, CategorySerializer, CartSerializer
from .models import Product, Category, Cart, Order, UserAddress

from rest_framework.decorators import api_view
from rest_framework.response import Response

from django.contrib import messages

from django.http import JsonResponse
from django.middleware.csrf import get_token

from django.contrib.auth import logout

import base64

@api_view(['GET'])
def getProductsByCategory(request, category):
    prodCat = Category.objects.all().get(name=category)
    products = Product.objects.all().filter(category_id=prodCat.id)
    serializer = ProductSerializer(products, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def getCategories(request):
    categories = Category.objects.all()
    serializer = CategorySerializer(categories, many=True)
    return Response(serializer.data)

@api_view(['POST'])
@csrf_exempt
def register(request):
    if request.method == 'POST':
        data = {}
        postLine = request.read().decode('utf-8')
        postLine = postLine.replace('{', '')
        postLine = postLine.replace('b\'', '')
        postLine = postLine.replace('}', '')
        postLine = postLine.replace('"', '')
        for line in postLine.split(','):
            data[line.split(':')[0].strip()] = line.split(':')[1].strip()
        
        username = data['username']
        password = data['password']
        email = data['email']
        first_name = data['firstname']
        last_name = data['lastname']
        postal = data['postal']
        city = data['city']
        address = data['address']
        
        
        isUser = User.objects.filter(username=username)
        if len(isUser) == 0:
            new_user = User.objects.create_user(is_superuser=False, is_staff=False, username=username, password=password, email=email, first_name=first_name, last_name=last_name)
            new_user.save()
            userAddress = UserAddress.objects.create(postal=postal, city=city, address=address, user=new_user)
            return JsonResponse({'message': 'Sikeres regisztráció!'})
        else:
            return JsonResponse({'message': 'A felhasználó már létezik!'})
    else:
        return JsonResponse({'message': 'Hiba történt a regisztráció során!'})

def index_view(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        
        if user is not None:
            if user.is_active:
                login(request, user)
                return redirect('index')  # Ide írd be a sikeres bejelentkezés utáni oldal nevét
            else:
                messages.error(request, 'A felhasználó letiltva.')
        else:
            messages.error(request, 'Hibás felhasználónév vagy jelszó.')
    return render(request, 'index.html')

def get_csrf_token(request):
    return JsonResponse({'csrf_token': get_token(request)})

def authenticated(request):
    return JsonResponse({'logged_in': request.user.is_authenticated})

def logout_req(request):
    if request.user.is_authenticated:
        logout(request)
        if not request.user.is_authenticated:
            return JsonResponse({'success': True, 'message': 'Sikeres kijelentkezés!'})
        else:
            return JsonResponse({'success': False, 'message': 'Valami hiba történt a kijelentkezés során!'})
    else:
        return JsonResponse({'success': True, 'error': 'Nincs bejelentkezve!'})

@api_view(['POST'])
@requires_csrf_token
def login_req(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        
        if user is not None:
            if user.is_active:
                login(request, user)
                return redirect('index')
            else:
                return redirect('index')
        else:
            return redirect('index')

def add_cart(request, item):
    if request.user.is_authenticated:
        item = Product.objects.get(id=item)
        Cart.objects.create(user=request.user, product=item)
        return JsonResponse({"succes": True})
    else: return JsonResponse({"succes": False})

@api_view(['GET'])
def get_cart(request):
    if request.user.is_authenticated:
        cart = Cart.objects.filter(user=request.user)
        serializer = CartSerializer(cart, many=True)
        return Response(serializer.data)
    else: return JsonResponse({"succes": False})
    
def remove_cart(request, item):
    if request.user.is_authenticated:
        item = Cart.objects.get(id=item)
        item.delete()
        return JsonResponse({"succes": True})
    else: return JsonResponse({"succes": False})

def create_order(request):
    if request.user.is_authenticated:
        order = Cart.objects.filter(user=request.user)
        address = UserAddress.objects.get(user=request.user)
        products = ""
        for item in order:
            products += f"{item.product.name} | "
            item.delete()
        Order.objects.create(user=request.user, address=address, products=products)
        
       
        return JsonResponse({"succes": True})
    else: return JsonResponse({"succes": False})
    
@api_view(['GET'])
def get_orders(request):
    if request.user.is_authenticated and request.user.is_staff:
        return render(request, 'orders_generic.html')
    else:
        return redirect('index')

@api_view(['GET'])
def get_active_orders(request):
    if request.user.is_authenticated and request.user.is_staff:
        orders = Order.objects.filter(active=True)
        return render(request, 'active_orders.html', {'orders': orders})
    else:
        return redirect('index')
    
def get_order_history(request):
    if request.user.is_authenticated and request.user.is_staff:
        orders = Order.objects.filter(active=False)
        return render(request, 'order_history.html', {'orders': orders})
    else:
        return redirect('index')

def order_done(request, item):
    if request.user.is_authenticated and request.user.is_staff:
        order = Order.objects.get(id=item)
        order.active = False
        order.save()
        return redirect('active_orders')