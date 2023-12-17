// J. Madeira --- February 2022

#include <iostream>

#include "Fraction.h"

int main(void) {
  Fraction zero;  // Has value ZERO
  Fraction fraction_1;
  Fraction fraction_2(5);
  Fraction fraction_3(2, 4);

  std::cout << "1st fraction: " << fraction_1 << " = " << fraction_1.ToDouble()
            << std::endl;

  std::cout << "2nd fraction: " << fraction_2 << " = " << fraction_2.ToDouble()
            << std::endl;

  std::cout << "3rd fraction: " << fraction_3 << " = " << fraction_3.ToDouble()
            << std::endl;

  std::cout << fraction_1 << " is equal to " << fraction_3;
  std::cout << " : " << std::boolalpha << (fraction_2 == fraction_3)
            << std::endl;

  std::cout << fraction_2 << " is different from " << fraction_3;
  std::cout << " : " << std::boolalpha << (fraction_2 != fraction_3)
            << std::endl;

  // For this simple class, the assignment operator works
  fraction_1 = fraction_2;

  std::cout << fraction_1 << " is equal to " << fraction_2;
  std::cout << " : " << std::boolalpha << (fraction_1 == fraction_2)
            << std::endl;

  // Arithmetic operations

  std::cout << fraction_2 << " + " << fraction_3;
  std::cout << " = " << fraction_2 + fraction_3 << std::endl;

  std::cout << fraction_1 << " - " << fraction_2;
  std::cout << " = " << fraction_1 - fraction_2 << std::endl;

  std::cout << fraction_1 << " * " << fraction_2;
  std::cout << " = " << fraction_1 * fraction_2 << std::endl;

  std::cout << fraction_2 << " / " << fraction_3;
  std::cout << " = " << fraction_2 / fraction_3 << std::endl;

  return 0;
}