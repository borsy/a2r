""""

M A GY A R Á Z A T

A megadott kódrészlet egy Django webshop alkalmazás nézet logikáját definiálja a REST API használatával.

Importált modulok:

from django.shortcuts import render: A Django shortcuts moduljából importálja a render függvényt, amely a sablonok renderelésére szolgál (de ebben a kódrészletben nem használjuk).
from .serializers import ProductSerializer, CategorySerializer: Az aktuális könyvtárból (serializers.py fájl) importálja a ProductSerializer és CategorySerializer osztályokat. Ezek a serializálók a termék és kategória modellek adatait alakítják API-k számára alkalmas formátumba.
from .models import Product, Category: Az aktuális könyvtárból (models.py fájl) importálja a Product és Category modelleket. Ezek a modellek a termékek és kategóriák adatait tárolják az adatbázisban.
from rest_framework.decorators import api_view: A Django REST keretrendszerből importálja az api_view dekorátort. Ez a dekorátor jelzi, hogy a függvény egy API nézetet definiál.
from rest_framework.response import Response: A Django REST keretrendszerből importálja a Response osztályt. Ezzel az osztállyal lehet adatokat visszaküldeni az API kérésekre.
Nézetek:

getProductsByCategory(request, category): Ez az API nézet egy megadott kategória termékeit listázza ki.
request: A kérést reprezentáló HTTP objektum.
category: Az URL-ből kiolvasott kategória neve.
A nézet megkeresi a megadott nevű kategóriát az adatbázisban, majd lekéri az összes olyan terméket, amelyik ehhez a kategóriához tartozik.
A lekert termékeket a ProductSerializer segítségével API-k számára alkalmas formátumba alakítja.
A Response objektum segítségével küldi vissza az adatokat a kliensnek.
getCategories(request): Ez az API nézet az összes kategóriát listázza ki.
request: A kérést reprezentáló HTTP objektum.
A nézet lekéri az összes kategóriát az adatbázisból.
A lekert kategóriákat a CategorySerializer segítségével API-k számára alkalmas formátumba alakítja.
A Response objektum segítségével küldi vissza az adatokat a kliensnek.
Összefoglalva:

Ez a kódrészlet két API nézetet definiál, amelyek a Category és Product modellek adatait teszik elérhetővé a REST API-n keresztül. A serializálók segítségével a modelladatokat API-k számára alkalmas JSON formátumba alakítják.

"""

from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import requires_csrf_token
from django.contrib.auth.models import User

from .serializers import ProductSerializer, CategorySerializer, CartSerializer
from .models import Product, Category, Cart, Order

from rest_framework.decorators import api_view
from rest_framework.response import Response

from django.contrib import messages

from django.http import JsonResponse
from django.middleware.csrf import get_token

from django.contrib.auth import logout

# Create your views here.


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

def index_view(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        
        if user is not None:
            if user.is_active:
                login(request, user)
                return redirect('success_page')  # Ide írd be a sikeres bejelentkezés utáni oldal nevét
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
        products = ""
        for item in order:
            products += f"{item.product.name} | "
            item.delete()
        new_order = Order(user=request.user, products=products)
        new_order.save()
        print("Új megrendelés érkezett!")
        return JsonResponse({"succes": True})
    else: return JsonResponse({"succes": False})