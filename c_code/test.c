#include <stdio.h>
#include <string.h>
#include <stdlib.h>
char * dispstr = "\
Silent Night\t平安夜\r\n\
Silent night, holy night!\t平安夜，圣善夜！\r\n\
All is calm, all is bright.\t万暗中，光华射，\r\n\
Round yon Virgin, Mother and Child.\t照着圣母也照着圣婴，\r\n\
Holy infant so tender and mild,\t多少慈详也多少天真，\r\n\
Sleep in heavenly peace,\t静享天赐安眠，\r\n\
Sleep in heavenly peace.\t静享天赐安眠。\r\n\
Silent night, holy night!\t平安夜，圣善夜！\r\n\
Shepherds quake at the sight.\t牧羊人，在旷野，\r\n\
Glories stream from heaven afar\t忽然看见了天上光华，\r\n\
Heavenly hosts sing Alleluia,\t听见天军唱哈利路亚，\r\n\
Christ the Savior is born!\t救主今夜降生，\r\n\
Christ the Savior is born.\t救主今夜降生!\r\n\
Silent night, holy night!\t平安夜，圣善夜！\r\n\
Son of God love's pure light.\t神子爱，光皎洁，\r\n\
Radiant beams from Thy holy face\t救赎宏恩的黎明来到，\r\n\
With dawn of redeeming grace,\t圣容发出来荣光普照，\r\n\
Jesus Lord, at Thy birth.\t耶稣我主降生，\r\n\
Jesus Lord, at Thy birth\t耶稣我主降生！\r\n";

void delay(int x)
{
	int a,y;
	for(a=0;a<10000;a++)
		for(y=0;y<x;y++)
			;
		;
}

int main(void)
{	
	int i, displen=strlen(dispstr),y;
	//system("ffmpeg -f alsa -ac 1 -i pulse -f x11grab -r 90 -s 1366x768 -i :0.0+0+0  -vcodec libx264 -vpre lossless_ultrafast -s 1366x768 hello.mkv&");
	//delay(1000);
	system("xsnow &");
	system("clear");
	printf("祝大家圣诞节快乐！！！\n\n\n");
	delay(10000);
	delay(10000);
	for(i=0;i<displen;i++){
		delay(3299);
		printf("%c",dispstr[i]);
	}
	delay(3000);
	delay(4444);
	delay(10000);
	system("sl");
	system("sl -l");
	system("sl -a");
	system("clear");
	system("killall -9 xsnow");
	system("killall -9 ffmpeg");
}
