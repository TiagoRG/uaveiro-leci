// Adapted from Horton's example

#include <iostream>
#include <string>

#include "Fraction.h"
#include "Pair.h"

int main(void) {
  Pair<int> pair_1 = Pair<int>(123, 456);
  std::cout << "1st pair is " << pair_1 << std::endl;

  Pair<int> pair_2 = Pair<int>(654, 321);
  std::cout << "2nd pair is " << pair_2 << std::endl;

  Pair<int> pair_3 = Pair<int>(654, 322);
  std::cout << "3rd pair is " << pair_3 << std::endl;

  std::cout << (pair_1 < pair_2 && pair_2 < pair_3
                    ? "operator< seems to be working"
                    : "oops")
            << std::endl;

  std::cout << (pair_1 == pair_2 ? "oops" : "operator== works as well")
            << std::endl;

  std::cout << (pair_2 == pair_3 ? "oops" : "operator== works as well")
            << std::endl;

  Pair<std::string> pair_4 = Pair<std::string>("Joaquim", "Madeira");
  std::cout << "4th pair is " << pair_4 << std::endl;

  Pair<std::string> pair_5 = Pair<std::string>("Joao", "Ribeiro");
  std::cout << "5th pair is " << pair_5 << std::endl;

  Pair<std::string> pair_6 = Pair<std::string>("Joaquim", "Martins");
  std::cout << "6th pair is " << pair_6 << std::endl;

  std::cout << (pair_5 < pair_4 && pair_4 < pair_6
                    ? "operator< seems to be working"
                    : "oops")
            << std::endl;

  std::cout << (pair_4 == pair_5 ? "oops" : "operator== works as well")
            << std::endl;

  std::cout << (pair_5 == pair_6 ? "oops" : "operator== works as well")
            << std::endl;

  std::cout << "Can also use objects of the Fracion (or any) class..."
            << std::endl;

  std::cout << "As long as the required operators are defined" << std::endl;

  Pair<Fraction> pair_7 = Pair<Fraction>(Fraction(1, 2), Fraction(1, 4));
  std::cout << "7th pair is " << pair_7 << std::endl;

  Pair<Fraction> pair_8 = Pair<Fraction>(Fraction(1, 2), Fraction(1, 3));
  std::cout << "8th pair is " << pair_8 << std::endl;

  std::cout << (pair_7 < pair_8
                    ? "pair_7 is lexicographically smaller than pair_8"
                    : "pair_7 is NOT lexicographically smaller than pair_8")
            << std::endl;

  std::cout << (pair_8 < pair_7
                    ? "pair_8 is lexicographically smaller than pair_7"
                    : "pair_8 is NOT lexicographically smaller than pair_7")
            << std::endl;

  return 0;
}
