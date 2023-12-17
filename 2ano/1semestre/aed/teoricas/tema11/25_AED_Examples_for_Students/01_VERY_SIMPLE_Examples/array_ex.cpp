#include <array>
#include <iostream>

using namespace std;

int main(void) {
  array<unsigned, 4> a = {0, 1, 2, 3};

  // display array size " 4"
  cout << " " << a.size() << endl;

  // display contents " 0 1 2 3"
  for (const auto& e : a) {
    cout << " " << e;
  }
  cout << endl;

  // display first element " 0"
  cout << " " << a.front();
  cout << endl;

  // change first element
  a.front() = 9;

  // display last element " 3"
  cout << " " << a.back();
  cout << endl;

  // change last element
  a.back() = 0;

  // display contents " 9 1 2 0"
  for (const auto& e : a) {
    cout << " " << e;
  }
  cout << endl;

  return (0);
}