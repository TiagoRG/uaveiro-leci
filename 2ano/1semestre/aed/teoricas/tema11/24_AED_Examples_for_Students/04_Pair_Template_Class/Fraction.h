// J. Madeira --- March 2023

#ifndef FRACTION_H_
#define FRACTION_H_

#include <iostream>

class Fraction {
 public:
  Fraction(void);
  Fraction(int numerator, int denominator = 1);

  int GetNumerator(void) const;
  void SetNumerator(int n);

  int GetDenominator(void) const;
  void SetDenominator(int n);

  // Comparison operators
  bool operator==(const Fraction& frac) const;
  bool operator!=(const Fraction& frac) const;
  bool operator<(const Fraction& frac) const;

  // Unary operator
  Fraction operator-(void) const;

  // Binary operators
  Fraction operator+(const Fraction& frac) const;
  Fraction operator-(const Fraction& frac) const;
  Fraction operator*(const Fraction& frac) const;
  Fraction operator/(const Fraction& frac) const;

  double ToDouble(void) const;

  friend std::ostream& operator<<(std::ostream& out, const Fraction& frac);

 private:
  void Reduce(void);

  int numerator_;
  int denominator_;  // ALWAYS POSITIVE !!!
};

#endif  // FRACTION_H_