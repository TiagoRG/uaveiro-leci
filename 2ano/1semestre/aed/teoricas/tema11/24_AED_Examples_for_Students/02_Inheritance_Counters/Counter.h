// J. Madeira --- March 2023

#ifndef COUNTER_H_
#define COUNTER_H_

#include <iostream>

class Counter {
 public:
  Counter(unsigned initial_value = 0);

  unsigned GetValue(void) const;

  void Inc(void);
  void Dec(void);

  // Comparison operators
  bool operator==(const Counter& c) const;
  bool operator!=(const Counter& c) const;
  bool operator<(const Counter& c) const;

  // Postfix operators
  // Extra parameter to allow for prefix and postfix notations
  Counter operator++(int);
  Counter operator--(int);

  // Prefix operators
  Counter& operator++(void);
  Counter& operator--(void);

  friend std::ostream& operator<<(std::ostream& out, const Counter& c);

 protected:
  unsigned value_;
};

#endif  // COUNTER_H_