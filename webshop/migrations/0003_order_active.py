# Generated by Django 5.0.3 on 2024-04-18 09:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('webshop', '0002_alter_order_products_useraddress'),
    ]

    operations = [
        migrations.AddField(
            model_name='order',
            name='active',
            field=models.BooleanField(default=False),
        ),
    ]
