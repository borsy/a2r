# SEGÍTSÉG TELEPÍTÉSHEZ

Először telepítsd fel a 'GIT'-et és a 'Python'-t!!!!
Miután telepítetted a git-et utána írd be a következő kódokat:

```bat
C:
cd C:\Users\%USERNAME%\Desktop
mkdir project
cd project
py -m venv starter
starter\Scripts\activate
git clone https://github.com/borsy/a2r
cd a2r
python.exe -m pip install --upgrade pip
pip install -r requirements.txt
py manage.py makemigrations
py manage.py migrate
py manage.py runserver
```
