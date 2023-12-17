#include <iostream>
#include <set>

using namespace std;

int main(void) {
  set<string> s;

  // display set size
  cout << " " << s.size() << endl;

  s.insert("February");
  s.insert("April");
  s.insert("May");
  s.insert("January");
  s.insert("March");
  s.insert("December");
  s.insert("March");
  s.erase("March");

  cout << endl;

  for (const auto& e : s) {
    cout << e << endl;
  }

  cout << endl;

  for (auto it = s.begin(); it != s.end(); ++it) {
    cout << (*it) << endl;
  }

  return (0);
}