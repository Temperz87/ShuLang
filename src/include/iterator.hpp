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
        typename std::vector<T>* _vec;
        int position = 0;

    public:
        Iterator(std::vector<T>* vector) {
            this->_vec = vector;
        }

        bool advance() {
            if (empty())
                return false;
            position += 1;
            return true;
        }

        bool empty() {
            return this->position >= this->_vec->size();
        }

        bool get(T& buf) {
            if (this->empty())
                return false;
            
            buf = this->_vec->at(this->position); 
            return true;
        }
};