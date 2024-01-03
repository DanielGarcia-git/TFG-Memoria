#include <assert.h>
#include <stdio.h>

int binarysearch1(const int *arr, int l, int r, int x)
{
    if (r >= l)
    {
        int mid = l + (r - l) / 2;

        if (arr[mid] == x)
            return mid;
        if (arr[mid] > x)
            return binarysearch1(arr, l, mid - 1, x);

        return binarysearch1(arr, mid + 1, r, x);
    }

    return -1;
}

int binarysearch2(const int *arr, int l, int r, int x)
{
    int mid = l + (r - l) / 2;

    while (arr[mid] != x) {
        if (r <= l || r < 0)
            return -1;
        if (arr[mid] > x)
            r = mid - 1;
        else
            l = mid + 1;

        mid = l + (r - l) / 2;
    }

    return mid;
}
