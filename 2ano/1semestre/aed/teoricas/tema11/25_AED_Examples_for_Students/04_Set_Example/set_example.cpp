//
// AED --- 2023/2024
//
// J Madeira, Dec 2023
//
// Using a set container to store Fraction objects and count repetitions
//

#include <cassert>
#include <cstdlib>  // For basic random number generation (std::rand() and srand())
#include <ctime>  // For std::time() (used to seed the pseudo-random number generator)
#include <iostream>
#include <set>

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

  unsigned int repeated_values = 0;

  set<Fraction> fractions_set;

  for (unsigned int i = 0; i < n; ++i) {
    Fraction frac = Fraction(1 + random(RANGE), 1 + random(RANGE));
    auto result = fractions_set.insert(frac);
    if (result.second == false) {  // Tried to insert a repeated fraction value
      ++repeated_values;
    }
  }

  // Checking
  assert(n == (fractions_set.size() + repeated_values));

  cout << "Number of created fractions  : " << n << endl;
  cout << "Number of repeated values    : " << repeated_values << endl;
  cout << "Number of different values   : " << fractions_set.size() << endl;

  unsigned int aux = 0;
  for (const auto& f : fractions_set) {
    cout << f << " --- ";
    aux++;
    if (aux % 6 == 0) {
      cout << endl;
    }
  }

  return 0;
}