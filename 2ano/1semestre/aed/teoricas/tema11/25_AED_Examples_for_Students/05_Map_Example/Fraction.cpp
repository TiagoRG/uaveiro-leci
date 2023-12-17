// J. Madeira --- February 2022

#include "Fraction.h"

#include <cassert>
#include <iostream>
#include <numeric>

Fraction::Fraction(void) : numerator_(0), denominator_(1) {}

Fraction::Fraction(int numerator, int denominator) {
  assert(denominator > 0);
  numerator_ = numerator;
  denominator_ = denominator;
  Reduce();
}

int Fraction::GetNumerator(void) const { return numerator_; }
void Fraction::SetNumerator(int n) {
  numerator_ = n;
  Reduce();
}

int Fraction ::GetDenominator(void) const { return denominator_; }
void Fraction::SetDenominator(int n) {
  assert(n > 0);
  denominator_ = n;
  Reduce();
}

// Comparison operators

bool Fraction::operator==(const Fraction& frac) const {
  return (numerator_ == frac.numerator_) && (denominator_ == frac.denominator_);
}

bool Fraction::operator!=(const Fraction& frac) const {
  return !(*this == frac);
}

bool Fraction::operator<(const Fraction& frac) const {
  return (numerator_ * frac.denominator_) < (frac.numerator_ * denominator_);
}

// Unary operator

Fraction Fraction::operator-(void) const {
  Fraction res(-numerator_, denominator_);
  return res;
}

// Binary operators
Fraction Fraction::operator+(const Fraction& frac) const {
  Fraction res(*this);
  if (res.denominator_ == frac.denominator_) {
    res.numerator_ += frac.numerator_;
  } else {
    res.numerator_ =
        res.numerator_ * frac.denominator_ + frac.numerator_ * res.denominator_;
    res.denominator_ *= frac.denominator_;
  }
  res.Reduce();
  return res;
}

Fraction Fraction::operator-(const Fraction& frac) const {
  return *this + (-frac);
}

Fraction Fraction::operator*(const Fraction& frac) const {
  Fraction res(*this);

  res.numerator_ *= frac.numerator_;
  res.denominator_ *= frac.denominator_;

  res.Reduce();
  return res;
}

Fraction Fraction::operator/(const Fraction& frac) const {
  assert(frac.numerator_ != 0);

  Fraction res(*this);

  res.numerator_ *= frac.denominator_;
  res.denominator_ *= frac.numerator_;

  // Ensure the denominator is POSITIVE
  if (res.denominator_ < 0) {
    res.numerator_ *= -1;
    res.denominator_ *= -1;
  }

  res.Reduce();
  return res;
}

double Fraction::ToDouble(void) const {
  return (double)numerator_ / (double)denominator_;
}

std::ostream& operator<<(std::ostream& os, const Fraction& frac) {
  os << frac.numerator_ << " / " << frac.denominator_;
  return os;
}

void Fraction::Reduce(void) {
  int gcd = std::gcd(numerator_, denominator_);  // Since C++17

  if (gcd != 1) {
    numerator_ /= gcd;
    denominator_ /= gcd;
  }
}