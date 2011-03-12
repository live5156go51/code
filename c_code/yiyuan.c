/*
 * 一元二次方程
 *author;junstrix
 *email:junstrix@gmail.com
 *date:2011-3-13
 */
#include <stdio.h>
#include <math.h>      /* gcc -lm */
#define LANGUAGE 0 		/* set system language 0->ENGLISH 1->CHINESE */
int main(int argc, char *argv[])
{
  int a,b,c;
  double x1,x2,delta;
  printf ("a = ?\n");
  scanf("%d",&a);
  printf ("\nb = ?\n");
  scanf("%d",&b);
  printf ("c = ?\n");
  scanf("%d",&c);
  printf ("a = %d b = %d c = %d\n",a,b,c);
  delta = b*b  - 4*a*c;
  if (delta > 0)
    {
      x1 =((-b)+sqrt(delta)/(2*a));
      x2 =((-b)-sqrt(delta)/(2*a));
      #if LANGUAGE
      printf ("你输入的一元二次方程有两个解：x1=%lf x2=%lf\n",x1,x2);
      #else
      printf ("have two resault: x1 = %lf x2 = %lf\n",x1,x2);
      #endif
    }
  else if (delta == 0)
    {
      x1 = (-b)/(2*a);
      x2  = x1;
      #if LANGUAGE
      printf ("你输入的一元二次有一个唯一解：x1=x2=%lf\n",x1);
      #else
      printf ("Only one resault: x1 = x2 = %lf\n",x1);
      #endif
    }
  else
    {
      #if LANGUAGE
      printf ("无解！\n");
      #else
      printf ("Result NULL\n");
      #endif      
    }
  return 0;
}
