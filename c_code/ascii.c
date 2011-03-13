#include <stdio.h>
/*
 *data:2011-3-13
 * 目的：格式化：%d %ld %f %lf %x %X %#x %#X %o %s %c
 */

int main(int argc, char *argv[])
{
  system("clear");
  char i;
  printf ("input char convert num . e.g:A\n");
  scanf("%c",&i);
  printf ("十进制：%d\n",i);
  printf ("十六进制：%#X\n",i);
  return 0;
}
