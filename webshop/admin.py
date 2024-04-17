"""

M A GY A R Á Z A T

Ez a kódrészlet az "a2r" Django projekt adminisztrációs paneljéhez kapcsolódik, és azt határozza meg, hogy mely modellek legyenek megjeleníthetők és kezelhetők az admin felületen.

Importált modulok:

from django.contrib import admin: Importálja az adminisztrációs panel eszközeit.
from .models import Category, Warehouse, Product: Importálja a Category, Warehouse, és Product modelleket a projekt aktuális könyvtárából (ahol ez a kód található).
Modellek regisztrálása:

admin.site.register(Category): Ez a sor regisztrálja a Category modellt az adminisztrációs panelen. Ez lehetővé teszi a kategóriák létrehozását, szerkesztését és törlését az admin felületen keresztül.
admin.site.register(Warehouse): Ugyanígy, a Warehouse modell is regisztrálásra kerül az adminisztrációs panelen.
admin.site.register(Product): A Product modell is regisztrálva van, lehetővé téve a termékek adatainak kezelését az admin felületen.
Összefoglalva:

Ez a kódrészlet regisztrálja a Category, Warehouse, és Product modelleket az "a2r" projekt adminisztrációs paneljén. Ez lehetővé teszi az adminisztrátorok számára a modellek adatainak megtekintését, hozzáadását, módosítását és törlését az admin felületen keresztül.

"""


from django.contrib import admin
from .models import Category, Warehouse, Product, Cart, Order, UserAddress

# Register your models here.

admin.site.register(Category)
admin.site.register(Warehouse)
admin.site.register(Product)
admin.site.register(Cart)
admin.site.register(Order)
admin.site.register(UserAddress)