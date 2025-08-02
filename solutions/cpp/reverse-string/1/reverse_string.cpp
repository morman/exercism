#include "reverse_string.h"

namespace reverse_string {

// receiving a standard string and returning a standard string
std::string reverse_string(std::string str)
{
    // initialize reversed string
    std::string reversed_string = "";
    
    // loop over the length of the string, end to beginning, one charcter at a time
    for (int i = str.length() - 1; i >= 0; i--)
    {
        // append to reversed string
        reversed_string += str[i];
    }
    return reversed_string;
}

}  // namespace reverse_string
