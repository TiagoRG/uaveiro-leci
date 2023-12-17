// J. Madeira --- March 2023

#include "Counter.h"

#include <cassert>
#include <iostream>
#include <limits>

Counter::Counter(unsigned initial_value) { value_ = initial_value; }

unsigned Counter::GetValue(void) const { return value_; }

void Counter::Inc(void) {
  if (value_ < std::numeric_limits<unsigned int>::max()) {
    value_++;
  }
}

void Counter::Dec(void) {
  if (value_ > 0) {
    value_--;
  }
}

// Comparison operators

bool Counter::operator==(const Counter& c) const {
  return (value_ == c.value_);
}

bool Counter::operator!=(const Counter& c) const { return !(*this == c); }

bool Counter::operator<(const Counter& c) const { return value_ < c.value_; }

// Postfix operators
// Extra parameter to allow for prefix and postfix notations

Counter Counter::operator++(int) {
  Counter old_counter = *this;
  Inc();
  return old_counter;
}

Counter Counter::operator--(int) {
  Counter old_counter = *this;
  Dec();
  return old_counter;
}

// Prefix operators
Counter& Counter::operator++(void) {
  Inc();
  return *this;
}

Counter& Counter::operator--(void) {
  Dec();
  return *this;
}

std::ostream& operator<<(std::ostream& os, const Counter& c) {
  os << c.value_;
  return os;
}
