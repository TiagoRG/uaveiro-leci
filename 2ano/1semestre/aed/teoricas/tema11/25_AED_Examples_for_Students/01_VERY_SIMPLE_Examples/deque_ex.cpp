#include <deque>
#include <iostream>

using namespace std;

int main(void) {
  deque<unsigned> d = {0, 1, 2, 3};

  // display deque size " 4"
  cout << " " << d.size() << endl;

  // display contents " 0 1 2 3"
  for (const auto& e : d) {
    cout << " " << e;
  }
  cout << endl;

  // display first element " 0"
  cout << " " << d.front();
  cout << endl;

  // change first element
  d.front() = 9;

  // display last element " 3"
  cout << " " << d.back();
  cout << endl;

  // change last element
  d.back() = 0;

  // display contents " 9 1 2 0"
  for (const auto& e : d) {
    cout << " " << e;
  }
  cout << endl;

  // At the front
  d.pop_front();
  d.pop_front();
  d.push_front(0);
  d.push_front(1);

  // At the back
  d.pop_back();
  d.push_back(0);
  d.push_back(1);

  // At any position
  d.at(2) = 9;

  // display contents
  for (const auto& e : d) {
    cout << " " << e;
  }
  cout << endl;

  return (0);
}