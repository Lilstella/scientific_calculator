import unittest
from calculator import ScientificCalculator as Calculator
import math

class TestCalculator(unittest.TestCase):
    def setUp(self):
        self.calc = Calculator()

    def test_initial_value(self):
        self.assertEqual(self.calc.value, 0)

    def test_add_method(self):
        self.calc.add(1, 3)
        self.assertEqual(self.calc.value, 4)

        self.calc.add(-1, -1)
        self.assertEqual(self.calc.value, -2)

        self.calc.add(0, 0)
        self.assertEqual(self.calc.value, 0)

        self.calc.add(2.5, 3.5)
        self.assertEqual(self.calc.value, 6)

    def test_subtract_method(self):
        self.calc.subtract(5, 3)
        self.assertEqual(self.calc.value, 2)

        self.calc.subtract(-1, -1)
        self.assertEqual(self.calc.value, 0)

        self.calc.subtract(0, 0)
        self.assertEqual(self.calc.value, 0)

        self.calc.subtract(2.5, 1.5)
        self.assertEqual(self.calc.value, 1)

    def test_multiply_method(self):
        self.calc.multiply(2, 3)
        self.assertEqual(self.calc.value, 6)

        self.calc.multiply(-1, -1)
        self.assertEqual(self.calc.value, 1)

        self.calc.multiply(0, 5)
        self.assertEqual(self.calc.value, 0)

        self.calc.multiply(2.5, 4)
        self.assertEqual(self.calc.value, 10)

    def test_divide_method(self):
        self.calc.divide(6, 3)
        self.assertEqual(self.calc.value, 2)

        self.calc.divide(-4, -2)
        self.assertEqual(self.calc.value, 2)

        self.calc.divide(5, 2)
        self.assertEqual(self.calc.value, 2.5)

        with self.assertRaises(ValueError):
            self.calc.divide(5, 0)
