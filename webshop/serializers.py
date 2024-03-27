"""

M A GY A R Á Z A T


Slide 1
Cím: Django REST keretrendszer és serializálók

Tartalom:

A Django REST keretrendszer egy népszerű könyvtár, amely segít RESTful API-kat (Application Programming Interface) létrehozni Django webes alkalmazásokban.
A serializálók olyan osztályok, amelyek a Django modellek adatait API-k számára alkalmas formátumba (például JSON) alakítják át.
Előadói jegyzetek:

A RESTful API-k egy architektúrási stílus, amelyet gyakran használnak webes szolgáltatások létrehozásához.
A serializálók fontos szerepet játszanak az adatok átvitele során a kliens és a szerver között.
Igen, kérem képet hozzáadni ehhez a diahoz: addImage

Slide 2
Cím: Termék és Kategória serializálók

Tartalom:

Ez a kódrészlet két serializálót definiál:
ProductSerializer: Ez a serializáló a Product modellt API-k számára alkalmas formátumba alakítja.
CategorySerializer: Ez a serializáló a Category modellt API-k számára alkalmas formátumba alakítja.
Tartalom (felsorolásos pontok):

Mindkét serializáló a rest_framework.serializers.ModelSerializer osztályt örökli.
A Meta belső osztály határozza meg a serializáló viselkedését:
fields = '__all__': Ez a beállítás azt jelenti, hogy a serializáló az összes mezőt tartalmazza a modellből.
model = Product: Ez a beállítás meghatározza, hogy melyik modellt kell serializálni.
depth = 1: Ez a beállítás meghatározza a kapcsolt modellek mélységét. Itt az 1-es érték azt jelenti, hogy a serializáló legfeljebb egy szintet mélyre megy a kapcsolt modellekbe. (A CategorySerializer esetében nincsenek kapcsolt modellek, így a depth érték 0-ra van állítva.)
Előadói jegyzetek:

A __all__ mező beállítás használata nem a legjobb gyakorlat, mivel felesleges információt is tartalmazhat. Célszerűbb kifejezetten meghatározni azokat a mezőket, amelyeket a válaszban vissza szeretnénk kapni.
A depth beállítás segít elkerülni a végtelen rekurzió problémáját, amikor a modellek egymással vannak összekapcsolva.
Igen, kérem képet hozzáadni ehhez a diahoz: addImage

Összefoglaló
Cím: Összefoglaló

Tartalom:

Ez a kód példa a Django REST keretrendszer használatára a modellek API-k számára alkalmas formátumba való átalakításához.
A serializálók használatával hatékonyan és rugalmasan kezelhető az adatátvitel a Django alkalmazásokban.
Előadói jegyzetek:

A REST keretrendszer és a serializálók kulcsfontosságú elemei a modern Django fejlesztésnek.
Ez a példa csak a serializálók alapvető használatát mutatja be. A Django REST keretrendszer számos más funkciót is kínál az API-k létrehozásához és kezeléséhez.
profilkép

3. dia
Cím: Serializálók finomhangolása

Tartalom:

A serializálók viselkedését a Meta belső osztályon kívül is finomhangolhatjuk:
exclude: Mezők listája, amelyeket nem kell serializálni.
read_only: Mezők listája, amelyeket csak a szerver módosíthat.
write_only: Mezők listája, amelyeket csak a kliens módosíthat.
validators: Validátorok listája, amelyeket a bemeneti adatok ellenőrzésére használhatunk.
Előadói jegyzetek:

A exclude és a read_only beállítások hasznosak lehetnek a bizalmas adatok védelme érdekében.
A write_only beállítások hasznosak lehetnek a beviteli adatok validálásához.
A validators beállítások segítségével egyedi validálási logikát implementálhatunk.
Kép: https://wikiszotar.hu/ertelmezo-szotar/Kuriz%C3%A1l

4. dia
Cím: További serializálási technikák

HyperlinkedModelSerializer: Hyperlinkeket ad a válaszhoz a kapcsolódó erőforrásokhoz.
ModelSerializerMixin: Használható a serializálók funkcionalitásának bővítésére.
Custom Serializers: Teljes mértékben egyedi serializálók definiálhatók.
Előadói jegyzetek:

A HyperlinkedModelSerializer hasznos lehet a HATEOAS (Hypertext As The Engine Of Application State) elvének implementálásához.
A ModelSerializerMixin hasznos lehet a serializálók közös funkcionalitásának kivonására.
Az egyedi serializálók akkor szükségesek, ha a beépített serializálók nem felelnek meg az igényeinknek.
Kép: https://skoll.hu/tanulasi-technikak-modszerek/

5. dia
Cím: Összefoglaló

Tartalom:

A Django REST keretrendszer hatékony eszköz a RESTful API-k fejlesztéséhez Django alkalmazásokban.
A serializálók kulcsfontosságú szerepet játszanak az adatok átvitele során a kliens és a szerver között.
A serializálók viselkedése finomhangolható a kívánt funkcionalitás elérése érdekében.
Előadói jegyzetek:

A Django REST keretrendszer dokumentációja további információkat és példákat tartalmaz a serializálók használatáról.
A Django közösség számos hasznos kiegészítőt és oktatóanyagot is kínál a REST API-k fejlesztéséhez.
Kép: https://en.bab.la/dictionary/hungarian-english/%C3%B6sszefoglal%C3%B3

profilkép


1
6. dia
Cím: Gyakorlati példa

Tartalom:

Tegyük fel, hogy van egy API-nk, amely termékeket listáz ki.
A termékmodellnek a következő mezői vannak:
id
name
description
price
category
Kép: [érvénytelen URL eltávolítva]

7. dia
Cím: Serializáló a termékmodellhez

Python
from .models import Product
from rest_framework.serializers import ModelSerializer

class ProductSerializer(ModelSerializer):
    class Meta:
        fields = ('id', 'name', 'description', 'price', 'category')
        model = Product
Körültekintően használja a kódot.
Előadói jegyzetek:

Ez a serializáló az összes mezőt tartalmazza a termékmodellből.
A category mező egy hivatkozás egy másik modellre, de a serializáló csak a kategória nevét adja vissza a válaszban.
8. dia
Cím: A válasz

JSON
[
    {
        "id": 1,
        "name": "Termék 1",
        "description": "Ez egy termék leírása.",
        "price": 1000.00,
        "category": {
            "id": 1,
            "name": "Kategória 1"
        }
    },
    ...
]
Körültekintően használja a kódot.
Előadói jegyzetek:

A válasz JSON formátumban van.
A válasz minden eleme egy terméknek felel meg.
A category mező egy beágyazott objektum, amely a kategória nevét és azonosítóját tartalmazza.
9. dia
Cím: További finomhangolás

A depth beállítással meghatározhatjuk, hogy hány szinten legyenek beágyazva a kapcsolt modellek.
A exclude beállítással eltávolíthatunk mezőket a válaszból.
A read_only és write_only beállításokkal szabályozhatjuk, hogy mely mezőket módosíthat a kliens.
Előadói jegyzetek:

A serializálók viselkedése finomhangolható a kívánt funkcionalitás elérése érdekében.
A Django REST keretrendszer dokumentációja további információkat és példákat tartalmaz a serializálók használatáról.
10. dia
Cím: Összefoglaló

A Django REST keretrendszer hatékony eszköz a RESTful API-k fejlesztéséhez Django alkalmazásokban.
A serializálók kulcsfontosságú szerepet játszanak az adatok átvitele során a kliens és a szerver között.
A serializálók viselkedése finomhangolható a kívánt funkcionalitás elérése érdekében.
Előadói jegyzetek:

A Django REST keretrendszer dokumentációja további információkat és példákat tartalmaz a serializálók használatáról.
A Django közösség számos hasznos kiegészítőt és oktatóanyagot is kínál a REST API-k fejlesztéséhez.
Kép: [érvénytelen URL eltávolítva]

Források
github.com/Moonsteel22/shop_backend
profilkép

11. dia
Cím: Gyakorlati feladat

Tartalom:

Hozzon létre egy API-t, amely listázza a kategóriákat és a termékeket.
A kategóriáknak legyen id, name és description mezőjük.
A termékeknek legyen id, name, description, price és category mezőjük.
Előadói jegyzetek:

Használja a Django REST keretrendszert és a serializálókat az API implementálásához.
A HyperlinkedModelSerializer osztályt használja hyperlinkek hozzáadásához a válaszhoz.
Tesztelje az API-t a curl vagy a Postman segítségével.
Kép: [érvénytelen URL eltávolítva]

"""

from .models import Product, Category, Cart
from rest_framework.serializers import ModelSerializer

class ProductSerializer(ModelSerializer):
    class Meta:
        fields = '__all__'
        model = Product
        depth = 1
        
class CategorySerializer(ModelSerializer):
    class Meta:
        fields = '__all__'
        model = Category
        depth = 0

class CartSerializer(ModelSerializer):
    class Meta:
        fields = '__all__'
        model = Cart
        depth = 2