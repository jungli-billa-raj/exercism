#include "binary.h"
#include "math.h"


int convert(const char *input){
  int length = 0;
  int no = 0;
  int power = 0;
  for (int i=0;input[i]!='\0';i++) {
    if (input[i]!='1' && input[i]!='0'){
      return INVALID;
    }
    ++length;
  }
  for (int i=length-1;i>=0;i--){
    if (input[i]=='0'){
      power++;
      continue;
    }
    no+=pow(2,power);
    power++;
  }
  return no;
}
