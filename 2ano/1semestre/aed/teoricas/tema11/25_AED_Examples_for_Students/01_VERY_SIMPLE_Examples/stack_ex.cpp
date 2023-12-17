#include <iostream>
#include <stack>

using namespace std;

int main(void) {
  stack<unsigned> s;

  // display stack size
  cout << " " << s.size() << endl;

  stack<size_t> uint_stack;

  for (size_t i = 0; i < 10; ++i) {
    uint_stack.push(i);
  }

  while (!uint_stack.empty()) {
    std::cout << uint_stack.top() << std::endl;
    uint_stack.pop();
  }

  return (0);
}