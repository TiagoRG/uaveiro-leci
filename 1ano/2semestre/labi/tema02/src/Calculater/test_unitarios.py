import unittest
import aritmetica

class TestAritmetica(unittest.TestCase):

    def test_soma(self):
        self.assertEqual(aritmetica.soma(2, 3), 5)
        self.assertEqual(aritmetica.soma(-2, 3), 1)
        self.assertEqual(aritmetica.soma(2.5, 3.7), 6.2)
        
    def test_subtracao(self):
        self.assertEqual(aritmetica.subtracao(2, 3), -1)
        self.assertEqual(aritmetica.subtracao(-2, 3), -5)
        self.assertEqual(aritmetica.subtracao(2.5, 3.7), -1.2)

    def test_multiplicacao(self):
        self.assertEqual(aritmetica.multiplicacao(2, 3), 6)
        self.assertEqual(aritmetica.multiplicacao(-2, 3), -6)
        self.assertEqual(aritmetica.multiplicacao(2.5, 3.7), 9.25)

    def test_divisao(self):
        self.assertEqual(aritmetica.divisao(6, 3), 2)
        self.assertEqual(aritmetica.divisao(7, 3), 2.33)
        self.assertRaises(ZeroDivisionError, aritmetica.divisao, 6, 0)

    def test_resto_divisao_inteira(self):
        self.assertEqual(aritmetica.resto_divisao_inteira(7, 3), 1)
        self.assertEqual(aritmetica.resto_divisao_inteira(10, 4), 2)
        self.assertEqual(aritmetica.resto_divisao_inteira(15, 5), 0)

    def test_raiz_quadrada(self):
        self.assertEqual(aritmetica.raiz_quadrada(9), 3)
        self.assertEqual(aritmetica.raiz_quadrada(16), 4)
        self.assertEqual(aritmetica.raiz_quadrada(25), 5)

if __name__ == '__main__':
    unittest.main()
