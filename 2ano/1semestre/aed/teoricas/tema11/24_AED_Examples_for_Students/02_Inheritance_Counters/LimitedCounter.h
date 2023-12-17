// J. Madeira --- March 2023

#ifndef LIMITED_COUNTER_H_
#define LIMITED_COUNTER_H_

#include <iostream>

#include "Counter.h"

class LimitedCounter : public Counter {
 public:
  LimitedCounter(unsigned max_value, unsigned initial_value = 0);

  void Inc(void);

  // Postfix operator
  // Extra parameter to allow for prefix and postfix notations
  LimitedCounter operator++(int);

  // operator-- is inherited!!

  // Prefix operator
  LimitedCounter& operator++(void);

  // operator-- is inherited!!

  friend std::ostream& operator<<(std::ostream& out, const LimitedCounter& c);

 private:
  unsigned max_value_;
};

#endif  // LIMITED_COUNTER_H_