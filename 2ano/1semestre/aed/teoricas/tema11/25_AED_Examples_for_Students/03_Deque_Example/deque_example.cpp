//
// AED --- 2023/2024
//
// J Madeira, Dec 2023
//
// Using a deque container to check if a string is a palindrome
//

#include <deque>
#include <iostream>

using namespace std;

int main(void) {
  string original_string;
  cout << "Write a character string without blank spaces : ";
  cin >> original_string;

  // Getting each char and pushing it into the back of a deque

  deque<char> d;

  for (char c : original_string) {
    d.push_back(c);
  }

  // Is it a palindrome ?
  // Read from both ends of the deque

  bool answer = true;

  while (answer && (d.size() > 1)) {
    if (d.front() != d.back()) {
      answer = false;
    } else {
      d.pop_front();
      d.pop_back();
    }
  }

  cout << "The string \"" << original_string << "\""
       << (answer ? " is " : " is NOT ") << "a palindrome !!" << endl;

  return 0;
}