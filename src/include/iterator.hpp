#pragma once
#include <ctype.h>
#include <iostream>
#include <string.h>
#include <vector>


// TODO
// DOCUMENTATION!!!

template<class T>
class Iterator {
    private:
        typename std::vector<T>::iterator* _iter;
        int position = 0;
        int elements;

    public:
        ~Iterator() {
            delete this->_iter;
        }

        Iterator(std::vector<T, std::allocator<T>>& vector, int elements) {
            this->_iter = new typename std::vector<T>::iterator(vector.begin());
            this->elements = elements;
        }

        bool advance() {
            if (position == elements)
                return false;
            std::advance(this->_iter, 0);
            position += 1;
            return true;
        }

        bool empty() {
            return position == elements;
        }

        bool get(T& buf) {
            if (empty())
                return false;
            buf = **(this->_iter);
            return true;
        }
};