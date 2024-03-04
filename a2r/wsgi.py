"""

M A GY A R Á Z A T

Ez a fájl a Django projekt WSGI (Web Server Gateway Interface) konfigurációját határozza meg. A WSGI egy szabványos protokoll a web kiszolgálók és web alkalmazások közötti kommunikációhoz.

Bevezető kommentek:

A fájl elején található kommentek leírják a fájl célját, és arra irányítják Önt, hogy hol találhat további információkat a WSGI konfigurációról a Django dokumentációjában.
Importált modul:

from django.core.wsgi import get_wsgi_application: Importálja a get_wsgi_application függvényt a Django magjából, amely létrehozza a WSGI alkalmazás objektumot.
Környezeti változó beállítása:

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'a2r.settings'): Ez a sor beállítja a DJANGO_SETTINGS_MODULE környezeti változót. Ez a változó határozza meg a Django projekt beállításokat tartalmazó fájl nevét és elérési útját. Itt az érték 'a2r.settings', ami azt jelenti, hogy a beállításokat az a2r projekt settings.py fájljában találja a rendszer.
WSGI alkalmazás létrehozása:

application = get_wsgi_application(): Ez a sor meghívja a get_wsgi_application függvényt, amely a beállítások alapján létrehozza a WSGI alkalmazás objektumot. Ez az objektum felelős a webes kérések fogadására és a válaszok továbbítására.
Összefoglalva:

Ez a fájl konfigurálja a WSGI interfészt az "a2r" projekt számára. Meghatározza a projekt beállítások helyét és létrehozza a WSGI alkalmazást, amely a web kiszolgálóval kommunikál.

"""

"""
WSGI config for a2r project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/5.0/howto/deployment/wsgi/
"""

import os

from django.core.wsgi import get_wsgi_application

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'a2r.settings')

application = get_wsgi_application()
