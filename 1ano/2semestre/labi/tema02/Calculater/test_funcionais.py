import unittest
from aritmetica import soma, subtracao, multiplicacao, divisao, raiz_quadrada, resto_divisao_inteira

class TestCalculadora(unittest.TestCase):
    
    def test_soma_numeros_validos(self):
        self.assertEqual(soma(2, 3), 5)
        self.assertEqual(soma(-2.5, 3.5), 1)
        self.assertEqual(soma(0, 0), 0)
        self.assertEqual(soma(0.1, 0.2), 0.3)
        
    def test_soma_argumentos_invalidos(self):
        with self.assertRaises(TypeError):
            soma("2", 3)
        with self.assertRaises(TypeError):
            soma(2, "3")
        with self.assertRaises(TypeError):
            soma("2", "3")
        with self.assertRaises(TypeError):
            soma(2)
        with self.assertRaises(TypeError):
            soma()
            
    def test_subtracao_numeros_validos(self):
        self.assertEqual(subtracao(5, 3), 2)
        self.assertEqual(subtracao(3, 5), -2)
        self.assertEqual(subtracao(-2.5, 3.5), -6)
        self.assertEqual(subtracao(0, 0), 0)
        self.assertEqual(subtracao(0.1, 0.2), -0.1)
        
    def test_subtracao_argumentos_invalidos(self):
        with self.assertRaises(TypeError):
            subtracao("2", 3)
        with self.assertRaises(TypeError):
            subtracao(2, "3")
        with self.assertRaises(TypeError):
            subtracao("2", "3")
        with self.assertRaises(TypeError):
            subtracao(2)
        with self.assertRaises(TypeError):
            subtracao()
            
    def test_multiplicacao_numeros_validos(self):
        self.assertEqual(multiplicacao(2, 3), 6)
        self.assertEqual(multiplicacao(-2.5, 3.5), -8.75)
        self.assertEqual(multiplicacao(0, 0), 0)
        self.assertEqual(multiplicacao(0.1, 0.2), 0.02)
        
    def test_multiplicacao_argumentos_invalidos(self):
        with self.assertRaises(TypeError):
            multiplicacao("2", 3)
        with self.assertRaises(TypeError):
            multiplicacao(2, "3")
        with self.assertRaises(TypeError):
            multiplicacao("2", "3")
        with self.assertRaises(TypeError):
            multiplicacao(2)
        with self.assertRaises(TypeError):
            multiplicacao()
            
    def test_divisao_numeros_validos(self):
            self.assertEqual(divisao(4, 2), 2)
            self.assertEqual(divisao(3, 5), 0.6)
            self.assertEqual(divisao(-10, 2), -5)
            self.assertEqual(divisao(0, 5), 0)
            
    def test_divisao_argumentos_invalidos(self):
        with self.assertRaises(TypeError):
            divisao("2", 3)
        with self.assertRaises(TypeError):
            divisao(2, "3")
        with self.assertRaises(TypeError):
            divisao("2", "3")
        with self.assertRaises(TypeError):
            divisao(2)
        with self.assertRaises(TypeError):
            divisao()
        with self.assertRaises(ZeroDivisionError):
            divisao(5, 0)
            
    def test_resto_divisao_inteira_numeros_validos(self):
        self.assertEqual(resto_divisao_inteira(7, 3), 1)
        self.assertEqual(resto_divisao_inteira(10, 2), 0)
        self.assertEqual(resto_divisao_inteira(-7, 3), 2)
        self.assertEqual(resto_divisao_inteira(0, 5), 0)

    def test_resto_divisao_inteira_argumentos_invalidos(self):
        with self.assertRaises(TypeError):
            resto_divisao_inteira("2", 3)
        with self.assertRaises(TypeError):
            resto_divisao_inteira(2, "3")
        with self.assertRaises(TypeError):
            resto_divisao_inteira("2", "3")
        with self.assertRaises(TypeError):
            resto_divisao_inteira(2)
        with self.assertRaises(TypeError):
            resto_divisao_inteira()

    def test_raiz_quadrada_numeros_validos(self):
        self.assertAlmostEqual(raiz_quadrada(4), 2)
        self.assertAlmostEqual(raiz_quadrada(9), 3)
        self.assertAlmostEqual(raiz_quadrada(2), 1.41)
        self.assertAlmostEqual(raiz_quadrada(0), 0)

    def test_raiz_quadrada_argumentos_invalidos(self):
        with self.assertRaises(ValueError):
            raiz_quadrada(-4)
        with self.assertRaises(TypeError):
            raiz_quadrada("2")
        with self.assertRaises(TypeError):
            raiz_quadrada()

if __name__ == '__main__':
    unittest.main()