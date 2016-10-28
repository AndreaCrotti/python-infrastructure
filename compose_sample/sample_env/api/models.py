from django.db import models

# Create your models here.

class MyModel(models.Model):
    name = models.CharField(null=True, max_length=100)
