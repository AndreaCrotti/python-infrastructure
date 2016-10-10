from django.test import TestCase

# Create your tests here.

class SampleTest(TestCase):
    def test_sample_assertion(self):
        self.assertEqual(2, 1 + 1)
