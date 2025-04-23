#include "fixstring.h"
#include "sort_helpers.h"

bool goes_before(fixstring x, fixstring y) {
    return fstring_less_eq(x, y);
}

void swap(fixstring a[], unsigned int i, unsigned int j) {
    fstring_swap(a[i], a[j]);
}
bool array_is_sorted(fixstring array[], unsigned int length) {
    unsigned int i = 1;
    while (i < length && goes_before(array[i-1], array[i])) {
        i++;
    }
    return (i >= length);
}