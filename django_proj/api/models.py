from django.db import models
from django.contrib.auth.models import User


class FirstDepencency(models.Model):
    user = models.ForeignKey(User)
    my_id = models.IntegerField(db_index=True, null=True)
