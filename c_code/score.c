#include <stdio.h>
/* 计算分数等级掌握选择流程控制 */
int main(int argc, char *argv[])
{
  float score;
  printf ("请输入你的成绩，然后评分等级：\n");
  scanf("%f",&score);
  if (score > 100)
    {
      printf ("你在做梦！\n");
    }
  else if (score >= 90 && score <= 100)
    {
      printf ("优秀！\n");
    }
  else if (score >= 80 && score < 90)
    {
      printf ("良好！\n");
    }
  else if (score >=60 && score <80)
    {
      printf ("及格！\n");
    }
  else if (score >=0 && score < 60)
    {
      printf ("不及格！\n");
    }
  else
    printf ("继续努力吧，不要自备！\n");
  return 0;
}
