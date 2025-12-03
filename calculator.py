class ScientificCalculator:
    def __init__(self):
        self.value = 0

    # Basic arithmetic operations
    def add(self, a, b):
        self.value = a + b

    def subtract(self, a, b):
        self.value = a - b

    def multiply(self, a, b):
        self.value = a * b

    def divide(self, a, b):
        if b == 0:
            raise ZeroDivisionError("Cannot divide by zero.")
        self.value = a / b
