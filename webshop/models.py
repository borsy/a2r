"""

M A GY A R Á Z A T

Ez a kódrészlet a Django webshop alkalmazás modelljeit definiálja. A modellek olyan osztályok, amelyek az adatbázban tárolt adatokat ábrázolják.

Importált modul:

from django.db import models: Importálja a models modult a Django db moduljából, amely az adatbázis modellek létrehozásához szükséges osztályokat és függvényeket tartalmazza.
Modellek:

Category: Ez a modell a termékek kategóriáit reprezentálja.

name: Szövegmező, amely a kategória nevét tárolja (maximum 255 karakter).
__str__() metódus: Meghatározza a kategória objektum sztring reprezentációját, ami a kategória nevét adja vissza.
Warehouse: Ez a modell a raktárakat reprezentálja.

name: Szövegmező, amely a raktár nevét tárolja (maximum 255 karakter).
postal: Egész szám mező, amely a raktár irányítószámát tárolja.
city: Szövegmező, amely a raktár városát tárolja (maximum 255 karakter).
address: Szövegmező, amely a raktár teljes címét tárolja.
__str__() metódus: Meghatározza a raktár objektum sztring reprezentációját, ami a raktár irányítószámát, címét és nevét adja vissza egy meghatározott formátumban.
Product: Ez a modell a termékeket reprezentálja.

name: Szövegmező, amely a termék nevét tárolja (maximum 255 karakter).
description: Szövegmező, amely a termék leírását tárolja.
freeze_cost: Tizedes mező, amely a termék fagyasztási költségét tárolja (maximum 20 számjegy, 2 tizedesjegy pontossággal).
price: Tizedes mező, amely a termék árát tárolja (maximum 20 számjegy, 2 tizedesjegy pontossággal).
quantity: Egész szám mező, amely a termék raktárkészletét tárolja.
category_id: Több-több kapcsolattal rendelkező mező, amely a termékhez tartozó kategóriákat tárolja. Ez azt jelenti, hogy egy termék több kategóriához is tartozhat. A blank=False beállítás azt jelenti, hogy a terméknek legalább egy kategóriát kell hozzárendelni.
warehouse_id: Több-több kapcsolattal rendelkező mező, amely a termék tárolási helyét (raktárait) tárolja. Ez azt jelenti, hogy egy termék több raktárban is tárolható. A blank=False beállítás azt jelenti, hogy a terméknek legalább egy raktárhoz kell kapcsolódnia.
__str__() metódus: Meghatározza a termék objektum sztring reprezentációját, ami a termék nevét adja vissza.
Összefoglalva:

Ez a kódrészlet az "a2r" projekt webshop alkalmazásához tartozó modelleket definiálja, amelyek a termékek, kategóriák és raktárak adatait reprezentálják az adatbázisban.

"""

from django.db import models

# Create your models here.
class Category(models.Model):
    name = models.CharField(max_length=255)
    
    def __str__(self):
        return self.name
    
class Warehouse(models.Model):
    name = models.CharField(max_length=255)
    postal = models.IntegerField()
    city = models.CharField(max_length=255)
    address = models.TextField()
    
    def __str__(self):
        return f"{self.postal} {self.address} | {self.name}"
    
class Product(models.Model):
    name = models.CharField(max_length=255)
    description = models.TextField()
    freeze_cost = models.DecimalField(max_digits=20, decimal_places=2)
    price = models.DecimalField(max_digits=20, decimal_places=2)
    quantity = models.IntegerField()
    category_id = models.ManyToManyField(Category, blank=False)
    warehouse_id = models.ManyToManyField(Warehouse, blank=False)

    def __str__(self):
        return f"{self.name}"