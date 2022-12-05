
# This function sorts a list (like list.sort)
# using the insertion sort algorithm.
# Modify it to accept a key= keyword argument that works like in list.sort.

def insertionSort(lst):
    # Traverse elements starting at position 1
    for i in range(1, len(lst)):
        # We know that lst[:i] is sorted
        x = lst[i]    # x is the element to insert next
        # Elements in lst[:i] that are > x must move one position ahead
        j = i - 1
        while j >= 0 and lst[j] > x:
            lst[j + 1] = lst[j]
            j -= 1
        # Then put x in the last emptied slot
        lst[j + 1] = x
        # Now we know that lst[:i+1] is sorted
    return



def main():
    # Original list
    lst0 = ["paulo", "augusto", "maria", "paula", "bernardo", "tito"]
    print("lst0", lst0)

    # sort in lexicographic order:
    lst = lst0.copy()
    insertionSort(lst)
    print("lst1", lst)
    assert lst == sorted(lst0)

    # sort by length (requires key= argument):
    lst = lst0.copy()
    insertionSort(lst, key=len)
    print("lst2", lst)
    assert lst == sorted(lst0, key=len)

    # sort by length, than lexicographic order:
    myorder = lambda s:(len(s), s)
    lst = lst0.copy()
    insertionSort(lst, key=myorder)
    print("lst3", lst)
    assert lst == sorted(lst0, key=myorder)

    print("All tests OK!")

if __name__ == "__main__":
    main()

