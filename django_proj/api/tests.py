from django.test import TestCase
from django.contrib.auth.models import User

from api import models


class SampleTest(TestCase):
    def test_sample_assertion(self):
        self.assertEqual(2, 1 + 1)


class ModelTest(TestCase):
    def test_model_insert(self):
        user = User.objects.create_user(username="pippo")
        models.FirstDepencency.objects.create(user=user)
        self.assertEqual(models.FirstDepencency.objects.count(), 1)
