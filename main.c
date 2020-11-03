#include <stdio.h>
#include <stdlib.h>

int main() {

  for (int t=0, osc = 0; t < 8000; t++, osc = osc + 14) {
    printf("%i\n", osc);
    //putchar(osc);
  }
  // sine
  /*
  for (int t=0, osc = 0; t < 8000; t++, osc = osc + 14) {
    putchar(127 * sin(osc/255.0*2*3.14) + 128);
  }
  */

  //int osc = 0;
  //int melody[8] = {21, 16, 19, 21, 19, 16, 14, 16};
  //for (int step = 0;;step = (step + 1) % 8) {
  //  int increment = melody[step];
  //  for (int t = 0; t < 4000; t++) {
  //    osc = osc + increment;
  //    printf("%c", osc);
  //  }
  //}

  //unsigned char a[18];
  //for (int i = 0; i < sizeof(a); i ++) a[i] = rand();
  //for (int t = 0; t < 8000; t++) {
  //  int i = t % sizeof(a);
  //  int j = (t+1) % sizeof(a);
  //  putchar(a[i] = (a[i] + a[j])/2);
  //}
}
