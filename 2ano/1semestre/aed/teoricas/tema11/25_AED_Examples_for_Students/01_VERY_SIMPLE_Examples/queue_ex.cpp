#include <iostream>
#include <queue>

using namespace std;

int main(void) {
  queue<unsigned> q;

  // display queue size
  cout << " " << q.size() << endl;

  queue<size_t> uint_queue;

  for (size_t i = 0; i < 10; ++i) {
    uint_queue.push(i);
  }

  while (!uint_queue.empty()) {
    std::cout << uint_queue.front() << std::endl;
    uint_queue.pop();
  }

  return (0);
}