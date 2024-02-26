from .models import Product, Category
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