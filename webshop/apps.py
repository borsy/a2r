"""

M A GY A R Á Z A T


Ez a kódrészlet a Django webshop alkalmazás konfigurációját definiálja.

Importált modul:

from django.apps import AppConfig: Importálja az AppConfig osztályt a Django apps moduljából.
WebshopConfig osztály:

class WebshopConfig(AppConfig): Ez a sor definiál egy WebshopConfig nevű osztályt, amely az AppConfig osztályból származik.
Osztály attribútumai:

default_auto_field = 'django.db.models.BigAutoField': Ez a sor beállítja az alkalmazás modelljeiben használt alapértelmezett elsődleges kulcs típusát. Itt a BigAutoField típus van beállítva, ami egy 64 bites egész számot használ.
name = 'webshop': Ez a sor beállítja az alkalmazás nevét. Ez a név a Django projekt különböző részeiben használatos az alkalmazás azonosítására.
Összefoglalva:

Ez a kódrészlet definiálja a webshop alkalmazás konfigurációját, beállítva az alapértelmezett elsődleges kulcs típusát és az alkalmazás nevét.

"""

from django.apps import AppConfig


class WebshopConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'webshop'
