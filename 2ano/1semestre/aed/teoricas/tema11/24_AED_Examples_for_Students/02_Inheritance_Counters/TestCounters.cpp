// J. Madeira --- March 2023

#include <iostream>

#include "Counter.h"
#include "LimitedCounter.h"

int main(void) {
  std::cout << "COUNTERS" << std::endl;

  Counter counter_1;
  Counter counter_2(5);
  Counter counter_3(4);

  std::cout << "1st counter: " << counter_1 << std::endl;

  std::cout << "2nd counter: " << counter_2 << std::endl;

  std::cout << "3rd counter: " << counter_3 << std::endl;

  std::cout << counter_1 << " is equal to " << counter_3;
  std::cout << " : " << std::boolalpha << (counter_1 == counter_3) << std::endl;

  std::cout << counter_2 << " is different from " << counter_3;
  std::cout << " : " << std::boolalpha << (counter_2 != counter_3) << std::endl;

  std::cout << counter_2 << " is smaller than " << counter_3;
  std::cout << " : " << std::boolalpha << (counter_2 < counter_3) << std::endl;

  // For this simple class, the assignment operator works
  counter_1 = counter_2;

  std::cout << counter_1 << " is equal to " << counter_2;
  std::cout << " : " << std::boolalpha << (counter_1 == counter_2) << std::endl;

  // Increment / Decrement operations

  std::cout << "1st counter: " << counter_1 << std::endl;

  ++counter_1;

  std::cout << "After ++counter_1: " << counter_1 << std::endl;

  counter_1++;

  std::cout << "After counter_1++: " << counter_1 << std::endl;

  Counter aux;

  std::cout << "aux counter: " << aux << std::endl;

  --counter_1;

  std::cout << "After --aux: " << aux << std::endl;

  std::cout << "LIMITED COUNTERS" << std::endl;

  LimitedCounter c_1(10);
  LimitedCounter c_2(5);

  std::cout << "1st counter: " << c_1 << std::endl;

  std::cout << "2nd counter: " << c_2 << std::endl;

  for (int i = 0; i < 12; i++) {
    c_1++;
    ++c_2;
  }

  std::cout << "1st counter: " << c_1 << std::endl;

  std::cout << "2nd counter: " << c_2 << std::endl;

  std::cout << c_1 << " is equal to " << c_2;
  std::cout << " : " << std::boolalpha << (c_1 == c_2) << std::endl;

  std::cout << c_2 << " is different from " << c_1;
  std::cout << " : " << std::boolalpha << (c_2 != c_1) << std::endl;

  std::cout << c_2 << " is smaller than " << c_1;
  std::cout << " : " << std::boolalpha << (c_2 < c_1) << std::endl;

  for (int i = 0; i < 12; i++) {
    --c_1;
    c_2--;
  }

  std::cout << "1st counter: " << c_1 << std::endl;

  std::cout << "2nd counter: " << c_2 << std::endl;

  return 0;
}