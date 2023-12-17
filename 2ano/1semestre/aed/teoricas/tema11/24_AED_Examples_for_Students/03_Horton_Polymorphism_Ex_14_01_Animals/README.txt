
-> Compile with -std=c++17, if needed.

-> std::string_view

Conceptually, string_view is only a view of the string and cannot​ be used to modify the actual string. 

When a string_view is created, there's no need to copy the data (unlike when you create a copy of a string).

Furthermore, in terms of size on the heap, string_view is smaller than std::string

-> virtual function specifier

Virtual functions are member functions whose behavior can be overridden in derived classes. 

As opposed to non-virtual functions, the overriding behavior is preserved even if there is no compile-time information about the actual type of the class. 

That is to say, if a derived class is handled using pointer or reference to the base class, a call to an overridden virtual function would invoke the behavior defined in the derived class. 

Such a function call is known as virtual function call or virtual call. 

Virtual function call is suppressed if the function is selected using qualified name lookup (that is, if the function's name appears to the right of the scope resolution operator ::).

-> std::shared_ptr

Defined in header <memory>

A smart pointer that retains shared ownership of an object through a pointer. 

Several shared_ptr objects may own the same object. 

The object is destroyed and its memory deallocated when either of the following happens:
- the last remaining shared_ptr owning the object is destroyed;
- the last remaining shared_ptr owning the object is assigned another pointer via operator= or reset().

-> final specifier 

Specifies that a virtual function cannot be overridden in a derived class or that a class cannot be derived from.

