//
// AED --- 2023/2024
//
// J Madeira, Dec 2023
//
// Using a map container to count Fraction object (key) occurrences (value)
//

#include <cassert>
#include <cstdlib>  // For basic random number generation (std::rand() and srand())
#include <ctime>  // For std::time() (used to seed the pseudo-random number generator)
#include <iostream>
#include <map>

#include "Fraction.h"

using namespace std;

// Function to generate a random integer 0 to count-1
unsigned int random(size_t count) {
  return static_cast<unsigned int>(rand() / (RAND_MAX / count + 1));
}

const unsigned int RANGE = 10;

int main(void) {
  std::srand(
      static_cast<unsigned int>(std::time(0)));  // Seed random number generator

  unsigned int n;
  cout << "Number of fractions to create : ";
  cin >> n;
  cout << endl;

  map<Fraction, unsigned int> fraction_counter;

  for (unsigned int i = 0; i < n; ++i) {
    Fraction frac = Fraction(1 + random(RANGE), 1 + random(RANGE));
    ++fraction_counter[frac];  // Great way of doing it !!
                               // If not in the map, insert with value 0
                               // and then update
  }

  // Checking
  unsigned int total_count = 0;
  for (const auto& item : fraction_counter) {
    total_count += item.second;
  }
  assert(n == total_count);

  cout << "Number of created fractions  : " << n << endl;
  cout << "Number of different values   : " << fraction_counter.size() << endl;

  unsigned int aux = 0;
  for (const auto& item : fraction_counter) {
    cout << item.first << " -> " << item.second << "     ";
    aux++;
    if (aux % 6 == 0) {
      cout << endl;
    }
  }

  return 0;
}