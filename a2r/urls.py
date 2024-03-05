"""

M A GY A R Á Z A T

Ez a fájl határozza meg, hogyan kapcsolódnak az URL-ek a Django projekt különböző nézeteihez. Nézzük meg részletesebben:

Bevezető kommentek:

A fájl elején található kommentek leírják a fájl célját, és arra irányítják Önt, hogy hol találhat további információkat az URL konfigurációról a Django dokumentációjában.
Példákat is mutat a különböző típusú nézetek használatára.
Importált modulok:

from django.contrib import admin: Importálja az adminisztrációs panel URL konfigurációját.
from django.urls import path: Importálja a path függvényt az URL-ek definiálásához.
from django.shortcuts import render: Importálja a render függvényt a sablonok rendereléséhez.
from webshop.views import getProductsByCategory, getCategories: Importálja a getProductsByCategory és getCategories függvényeket a webshop alkalmazás nézetei közül.
Az index nézet:

def index(request):: Ez a függvény definiálja az "index" nézetet, amely az üres URL-hez (/) kapcsolódik.
return render(request, 'index.html'): Ez a sor a render függvényt használja, hogy a index.html sablonfájlt renderelje a kéréshez, és a választ küldje vissza a böngészőnek.
URL konfiguráció:

urlpatterns = [: Ez a sor létrehoz egy urlpatterns listát, amely az URL-ek konfigurációját tárolja.
path('admin/', admin.site.urls): Ez a sor az adminisztrációs panel URL-eit kapcsolja az /admin/ URL-hez.
path('', index): Ez a sor az üres URL-t (/) az index nézethez kapcsolja.
path('category/<str:category>', getProductsByCategory): Ez a sor a /category/<category> URL-t a getProductsByCategory nézethez kapcsolja. A <str:category> rész egy dinamikus paraméter, amely a kategória nevét tartalmazza.
path('categories/', getCategories): Ez a sor a /categories/ URL-t a getCategories nézethez kapcsolja.
Összefoglalva:

Ez a fájl meghatározza az "a2r" projekt URL konfigurációját. Alapértelmezetten az üres URL a főoldalnak megfelelő sablont (index.html) jeleníti meg. Ezen kívül definiál URL-eket a kategóriák kezelésére és az adminisztrációs panel elérésére.

"""

"""
URL configuration for a2r project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.shortcuts import render
from webshop.views import getProductsByCategory, getCategories
from webshop.views import index_view
from django.contrib.auth.views import LoginView
from webshop.views import get_categories_authenticated

from webshop.views import get_csrf_token

from webshop.views import check_login_status

from webshop.views import logout_view

def index(request):
    return render(request, 'index.html')


urlpatterns = [
    path('admin/', admin.site.urls),
    path('category/<str:category>', getProductsByCategory),
    path('categories/', getCategories),
    path('', index_view, name='index'),
    path('login/', LoginView.as_view(), name='login'),
    path('get-csrf-token/', get_csrf_token, name='get_csrf_token'),
    path('categories-authenticated/', get_categories_authenticated, name='get_categories_authenticated'),
    path('check_login_status/', check_login_status, name='check_login_status'),
    path('logout/', logout_view, name='logout')
]
