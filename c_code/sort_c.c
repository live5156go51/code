#include <stdio.h>
/* 输入任意三个整数，进行排序 */
int main(int argc, char *argv[])
{
  int a, b, c;
  int t;
  printf ("输入三个整数，中间空格分隔：\n");
  scanf("%d %d %d",&a ,&b, &c);
  if (a < b)
    {
      t = a;
      a = b;
      b = t;
    }
  if (a < c)
    {
      t = c;
      c = a;
      a = t;
    }
  if (b < c)
    {
      t = c;
      c = b;
      b = t;
    }
  printf ("%d %d %d\n",a ,b,c);
  return 0;
}
