#include "fibonacci.hpp"
#include <stdexcept>

int Fibonacci::compute(int n) const {
    if (n < 0) {
        throw std::invalid_argument("Negative input not allowed");
    }

    if (n <= 1) {
        return n;
    }

    int previous = 0;
    int current = 1;
    for (int i = 2; i <= n; ++i) {
        long long next = previous + current;
        if (next > INT32_MAX) {
            throw std::overflow_error("Result too big");
        }
        previous = current;
        current = next;
    }
    return current;
}
