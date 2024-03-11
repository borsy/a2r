"""

M A GY A R Á Z A T


Ez a fájl a Django "a2r" projekthez tartozó beállításokat tartalmazza. A Django egy web keretrendszer, amely segít Önnek weboldalak és webes alkalmazások létrehozásában. Ez a fájl meghatározza, hogyan fog működni az "a2r" projekt.

Nézzük részletesebben a tartalmát:

Kommentár: A fájl elején található kommentek a tartalmat magyarázzák, és arra irányítják Önt, hogy hol találhat további információkat a Django beállításokról.
Beállítások importálása: A from pathlib import Path sor a pathlib könyvtárból importálja a Path osztályt, amely a fájl elérési útvonalak kezelésében segít.
Alapértelmezett könyvtár megadása: A BASE_DIR = Path(__file__).resolve().parent.parent sor beállítja a BASE_DIR változót a beállításokat tartalmazó fájl (settings.py) könyvtárának abszolút elérési útjára. Ezt gyakran használják a projekt egyéb fájl elérési útvonalainak létrehozásához.
Django fejlesztői beállítások: Ez a rész kifejezetten a fejlesztői környezetekre vonatkozó beállításokat tartalmazza:
SECRET_KEY: Ez egy titkos kulcs, amelyet a Django különböző biztonsági célokra használ. Rejtve kell tartani, és soha nem szabad nyilvánosan megosztani. (Megjegyzés: A kódban megadott érték csak példa, és egy biztonságos, egyedi titkos kulcsra kell cserélni.)
DEBUG: Ez a beállítás True értékre van állítva, ami lehetővé teszi a hibakeresési funkciókat a fejlesztés során, de éles környezetben ki kell kapcsolni.
ALLOWED_HOSTS: Ez a lista jelenleg üres, ami azt jelenti, hogy az alkalmazás csak a helyi gépről lesz elérhető. Éles környezetbe való telepítés esetén hozzá kell adnia az engedélyezett hosztneveket.
Telepített alkalmazások: Az INSTALLED_APPS lista meghatározza azokat a Django alkalmazásokat, amelyek telepítve vannak és használatban vannak a projektben. Itt a következőket tartalmazza:
Beépített Django alkalmazások, mint például a django.contrib.admin (adminisztrációs panel), a django.contrib.auth (felhasználó hitelesítés) és mások.
Egy webshop nevű egyéni alkalmazás, amely valószínűleg a webáruház funkciójának alapvető logikáját tartalmazza.
rest_framework, egy népszerű könyvtár webes API-k készítéséhez Django használatával.
Köztes szoftver (middleware): A MIDDLEWARE lista olyan middleware komponenseket definiál, amelyek a kéréseket és válaszokat kezelik, mielőtt azok eljutnának a Django nézetekhez. Ezek a komponensek különböző feladatokat hajthatnak végre, például biztonsági ellenőrzéseket, munkamenet-kezelést és egyebeket.
Gyökér URL konfiguráció és sablonok:
ROOT_URLCONF: Ez a változó meghatározza azt a Python modult, amely a projekt fő URL konfigurációját tartalmazza, amely az URL-eket az alkalmazás nézeteihez társítja.
TEMPLATES: Ez a rész határozza meg, hogyan fogja a Django az HTML sablonokat renderelni. Megadja a sablon motorját és a könyvtárakat, ahol a Django a sablonokat keresi.
WSGI alkalmazás: A WSGI_APPLICATION változó meghatározza a webes kérések kezelésének belépési pontját a WSGI (Web Server Gateway Interface) protokoll használatával.
Adatbázis konfiguráció:
DATABASES: Ez a szótár határozza meg az adatbázis konfigurációját. Jelenleg egy SQLite adatbázis használatára van állítva, amelynek neve db.sqlite3, és a projekt alapértelmezett könyvtárában található.

Jelszó érvényesítés:

AUTH_PASSWORD_VALIDATORS: Ez a lista olyan validátorokat definiál, amelyek érvényesítik a felhasználói jelszavakra vonatkozó követelményeket, mint például a minimális hosszúság és a karaktertípusok.
Internazionalizáció:

LANGUAGE_CODE: Ez a beállítás meghatározza a projekt alapértelmezett nyelvét, ami itt az angol ("en-us").
TIME_ZONE: Ez a beállítás meghatározza a projekt alapértelmezett időzónáját, ami itt az UTC.
USE_I18N: Ez a beállítás True értékre van állítva, ami lehetővé teszi a nemzetköziesítési funkciókat.
USE_TZ: Ez a beállítás True értékre van állítva, ami lehetővé teszi az időzóna használatát.
Statikus fájlok:

STATIC_URL: Ez a változó meghatározza a statikus fájlok (mint CSS, JavaScript és képek) kiszolgálására szolgáló alap URL-t.
STATICFILES_DIRS: Ez a lista meghatározza azokat a könyvtárakat, ahol a Django a statikus fájlokat keresi.
Alapértelmezett elsődleges kulcs típusa:

DEFAULT_AUTO_FIELD: Ez a beállítás meghatározza az adatbázis modellek elsődleges kulcsaihoz használt alapértelmezett adattípust.
Összefoglalva:

Ez a Django beállítások fájl konfigurációt biztosít az "a2r" projekthez, meghatározva a telepített alkalmazásokat, az adatbázis kapcsolatot, a sablonok renderelését és további beállításokat.

"""

"""
Django settings for a2r project.

Generated by 'django-admin startproject' using Django 5.0.2.

For more information on this file, see
https://docs.djangoproject.com/en/5.0/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/5.0/ref/settings/
"""

from pathlib import Path
from django.urls import reverse_lazy

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent
LOGIN_REDIRECT_URL = reverse_lazy('index')


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/5.0/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'django-insecure-(5@vu_ty$_jy-x3^)fqg=k14zw^d+)#ajt$@z1ybc=+mxlkmz_'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = []


# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'rest_framework',
    'webshop',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'a2r.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [BASE_DIR / 'website/templates'],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'a2r.wsgi.application'


# Database
# https://docs.djangoproject.com/en/5.0/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
    }
}


# Password validation
# https://docs.djangoproject.com/en/5.0/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/5.0/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/5.0/howto/static-files/

STATIC_URL = 'static/'

STATICFILES_DIRS = [
    BASE_DIR / 'website/static/'
]

# Default primary key field type
# https://docs.djangoproject.com/en/5.0/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'
