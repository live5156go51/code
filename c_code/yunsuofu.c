#include <stdio.h>
/* 注意除法何种情况结果为整数，何种情况为实数 */
/* % 除数要为整数 */
/* 逻辑运算符 &&  || 左边表达式真假情况，后边表达的还是否还执不执行？ */
int main(int argc, char *argv[])
{
  printf ("%d , %d, %lf, %lf, %d\n",3/2,-3/2,3/0.2,3/-0.2,-3/-2); /* warning: format ‘%d’ expects type ‘int’, but argument  has type ‘double’ */
  /* 取%要为整数，只要有一个为实数，结果就是实数 */
  int i = 50;
  int j = 10;
  int m  ;
  int n;
printf ("-------&&和||左边表达式真假后面是否再执行？---\n");
  m = (2>3) && (j = 50);
  n = (3>2) || (i = 10);
  printf ("m = %d, j = %d\n",m,j);
  printf (" n = %d , i = %d\n",n,i);
  return 0;
}
