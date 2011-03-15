/* 综合练习奇数 偶数 强制类型转换 */
/* 如何验证一个数为〇 if(|x-0.00001| < 0.00001) */
#include <stdio.h>
int main(int argc, char *argv[])
{
  int i = 0,sum = 0;
  int aa;
  int j_sum=0,a_sum=0;		/* 奇数偶数和变量 */
  int j_sum_cnt = 0,a_sum_cnt = 0; /* 奇偶个数 */
  float j_sum_avg = 0.0,a_sum_avg = 0.0; /* 奇数偶数平均值 */
  float aa_sum;
  /* for (i = 1; i <= 10; i += 2)	/\* 1 ~ 10所有基数之和 *\/ */
  /*   { */
  /*     sum += 1;       */
  /*   } */
  /* for ( i = 1; i <= 12; ++i)	/\* 被3整除 *\/ */
  /*   { */
  /*     if (i%3 == 0) */
  /* 	{ */
  /* 	  sum += i; */
  /* 	} */
  /*   } */
  /* for (i = 1; i <= 100; i+=2)	/\* 1~100所有奇数之后 *\/ */
  /*   { */
  /*     sum += i; */
  /*   } */
  /* for (i = 1; i <= 100; ++i) */
  /*   { */
  /*     if (i%2 == 0)		/\* 1~100所有偶数之和 *\/ */
  /* 	{ */
  /* 	  sum += i; */
  /* 	} */
  /*   } */

  /* /\*** */
  /*     1+1/2+1/3+ ... +1/100 */
  /*     强制数据类型转换 */
  /*  ***\/ */
  /* for (aa = 1; aa <= 100; ++aa) */
  /*   { */
  /*     aa_sum = aa_sum +(float) 1/aa; */
  /*   } */
  /* printf ("aa_sum = %f\n",aa_sum); */
  for (i = 1; i <= 100; ++i)
    {
      if (i%2==1)
	{
	  j_sum = j_sum + i;	/* 奇数和 */
	  ++j_sum_cnt;
	}
      else
	{
	  a_sum = a_sum + i;	/* 偶数和 */
	  ++a_sum_cnt;
	}
    }
  printf ("j_sum = %d\n",j_sum);
  printf ("j_sum_cnt = %d\n",j_sum_cnt);
  printf ("j_sum_avg = %f\n",j_sum_avg = (float)j_sum/a_sum_cnt);
  printf ("a_sum = %d\n",a_sum);
  printf ("a_sum_cnt = %d\n",a_sum_cnt);
  printf ("a_sum_avg = %f\n",a_sum_avg = (float)a_sum/a_sum_cnt);
  printf ("sum = %d\n",sum);
  printf ("i = %d\n",i);	/* i 到最后执行共执行了5次 */
  return 0;
}
