from django.shortcuts import render, redirect
from . import forms
from django.contrib.auth import authenticate, login

def adminsite(request):
    if request.user.is_authenticated:
        if request.user.groups.filter(name="admin").exists():
            return render(request, 'admin_main.html')
        else:
            return redirect('index')
    else:
        return render(request, 'admin_login.html')

def admin_login(request):
    if request.method == 'POST':
        form = forms.LoginForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data['username']
            password = form.cleaned_data['password']

            user = authenticate(request, username=username, password=password)
            if user is not None:
                login(request, user)
                return redirect('admins')
    else:
        form = forms.LoginForm()
    return render(request, 'admin_login.html', {'form':form})
            