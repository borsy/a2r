from django.shortcuts import render

from .serializers import ProductSerializer, CategorySerializer
from .models import Product, Category

from rest_framework.decorators import api_view
from rest_framework.response import Response

# Create your views here.

@api_view(['GET'])
def getProductsByCategory(request, category):
    prodCat = Category.objects.all().get(name=category)
    products = Product.objects.all().filter(category_id=prodCat.id)
    serializer = ProductSerializer(products, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def getCategories(request):
    categories = Category.objects.all()
    serializer = CategorySerializer(categories, many=True)
    return Response(serializer.data)