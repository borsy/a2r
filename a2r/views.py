from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from . import forms

@login_required(login_url='index')
def adminsite(request):
    return render(request, 'admin/admin_main.html')

def admin_main(request):
    if request.user.is_authenticated:
        if request.user.groups.filter(name='admin').exists():
            return render(request, 'admin/admin_main.html')
        else:
            return redirect('index')
    else:
        return render(request, 'admin/admin_login.html')