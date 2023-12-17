//
// AED --- 2023/2024
//
// J Madeira, Dec 2023
//
// Using a queue container to reverse the digits of a positive integer number
//

#include <iostream>
#include <queue>

using namespace std;

int main(void) {
  int original_number = 0;
  cout << "Write a positive integer value : ";
  cin >> original_number;

  if (original_number <= 0) {
    cout << "*** Should be a positive integer!! ***" << endl;
    return 0;
  }

  cout << "The original number : " << original_number << endl;

  // Getting each digit and pushing it into a queue

  queue<unsigned int> q;
  unsigned int digit;

  while (original_number > 0) {
    digit = original_number % 10;
    q.push(digit);
    original_number /= 10;
  }

  // New number with digits in reverse order

  unsigned int new_number = 0;

  while (!q.empty()) {
    digit = q.front();
    q.pop();
    new_number = new_number * 10 + digit;
  }

  cout << "In reverse order    : " << new_number << endl;

  return 0;
}