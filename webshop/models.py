from django.db import models
from django.contrib.auth.models import User

class Category(models.Model):
    name = models.CharField(max_length=255)
    
    def __str__(self):
        return self.name
    
class Warehouse(models.Model):
    name = models.CharField(max_length=255)
    postal = models.IntegerField()
    city = models.CharField(max_length=255)
    address = models.TextField()
    
    def __str__(self):
        return f"{self.postal} {self.address} | {self.name}"
    
class Product(models.Model):
    name = models.CharField(max_length=255)
    description = models.TextField()
    freeze_cost = models.DecimalField(max_digits=20, decimal_places=2)
    price = models.DecimalField(max_digits=20, decimal_places=2)
    quantity = models.IntegerField()
    category_id = models.ForeignKey(Category, blank=False, on_delete=models.CASCADE)
    warehouse_id = models.ForeignKey(Warehouse, blank=False, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.name}"

class Cart(models.Model):
    user = models.ForeignKey(User, blank=False, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, blank=False, on_delete=models.CASCADE)
    
    def __str__(self):
        return f"{self.user.username} | {self.product.name}"