// Pair.h

// Just one generic type --- Adapted form Horton's example --- J. Madeira

#ifndef PAIR_H
#define PAIR_H

#include <ostream>

template <typename T>
class Pair {
 public:  // To simplify the example
  T first_;
  T second_;

  Pair();
  Pair(const T& f, const T& s);

  bool operator==(const Pair& other) const;
  bool operator<(const Pair& other) const;
};

// Default constructor
template <typename T>
Pair<T>::Pair() : first_{}, second_{} {}

// Constructor
template <typename T>
Pair<T>::Pair(const T& f, const T& s) : first_{f}, second_{s} {}

// Comparison operators
template <typename T>
bool Pair<T>::operator==(const Pair& other) const {
  return first_ == other.first_ && second_ == other.second_;
}

template <typename T>
bool Pair<T>::operator<(const Pair& other) const {
  return first_ < other.first_ ||
         (first_ == other.first_ && second_ < other.second_);
}

template <typename T>
std::ostream& operator<<(std::ostream& stream, const Pair<T>& pair) {
  return stream << '(' << pair.first_ << ", " << pair.second_ << ')';
}

#endif