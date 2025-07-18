#pragma once
#include <ctype.h>
#include <iostream>
#include <memory>
#include <stdexcept>
#include <string.h>
#include <vector>


// TODO
// DOCUMENTATION!!!

template<class T>
class Iterator {
    private:
        std::vector<T> _vec;
        int position = 0;

    public:
        Iterator() {
            this->_vec = std::vector<T>();
        }

        Iterator(std::vector<T> vector) {
            this->_vec = vector;
        }

        bool advance() {
            if (empty()) {
#if __cpp_exceptions
                throw std::out_of_range("THE ITERATOR IS OUT OF RANGE");
#endif
                return false;
            }
            position += 1;
            return true;
        }

        bool empty() {
            return this->position >= this->_vec.size();
        }

        bool get(T& buf) {
            if (this->empty())
                return false;
            
            buf = this->_vec.at(this->position); 
            return true;
        }
};