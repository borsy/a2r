from django.db import models

# Create your models here.
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
    category_id = models.ManyToManyField(Category, blank=False)
    warehouse_id = models.ManyToManyField(Warehouse, blank=False)

    def __str__(self):
        return f"{self.name}"
