#include <iostream>
#include <vector>

using namespace std;

int main(void) {
  vector<unsigned> v = {0, 1, 2, 3};

  // display vector size " 4"
  cout << " " << v.size() << endl;

  // display contents " 0 1 2 3"
  for (const auto& e : v) {
    cout << " " << e;
  }
  cout << endl;

  // display first element " 0"
  cout << " " << v.front();
  cout << endl;

  // change first element
  v.front() = 9;

  // display last element " 3"
  cout << " " << v.back();
  cout << endl;

  // change last element
  v.back() = 0;

  // display contents " 9 1 2 0"
  for (const auto& e : v) {
    cout << " " << e;
  }
  cout << endl;

  // At the front
  v.erase(v.begin());
  v.erase(v.begin());
  v.insert(v.begin(), 0);
  v.insert(v.begin(), 1);

  // At the back
  v.pop_back();
  v.push_back(0);
  v.push_back(1);

  // At any position
  v.at(2) = 9;

  // display contents
  for (const auto& e : v) {
    cout << " " << e;
  }
  cout << endl;

  return (0);
}