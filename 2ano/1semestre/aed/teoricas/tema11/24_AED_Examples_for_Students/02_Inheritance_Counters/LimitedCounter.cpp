// J. Madeira --- March 2023

#include "LimitedCounter.h"

#include <cassert>
#include <iostream>
#include <limits>

#include "Counter.h"

LimitedCounter::LimitedCounter(unsigned max_value, unsigned initial_value)
    : Counter(initial_value) {
  max_value_ = max_value;
}

void LimitedCounter::Inc(void) {
  if (value_ < max_value_) {
    value_++;
  }
}

// Postfix operators
// Extra parameter to allow for prefix and postfix notations

LimitedCounter LimitedCounter::operator++(int) {
  LimitedCounter old_LimitedCounter = *this;
  Inc();
  return old_LimitedCounter;
}

// Prefix operators
LimitedCounter& LimitedCounter::operator++(void) {
  Inc();
  return *this;
}

std::ostream& operator<<(std::ostream& os, const LimitedCounter& c) {
  os << c.value_;
  return os;
}
