/*
 *输入互联网主机名，获取IP地址
 *编译：gcc -o getaddr GetIpFromHost.c -lnsl
 *author:junstrix
 *email:junstrix@gmail.com
 *date:2011/3/16
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*for sockets */
#include <sys/types.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <netdb.h>		/* by gethostbyname() */

int main(int argc, char *argv[])
{
  struct hostent *host;		/* gethostbyname() struct */
  struct in_addr address;	/* IP addr struct */
  char host_name[256];		/* sring host_name */

  if (argc != 2)
    {
      printf ("请输入:getaddr host_name\n");
      printf ("e.g:getaddr imljp.info\n");
      exit(1);
    }
  else
    {
      strcpy(host_name,argv[1]);
    }
  printf ("正在查找主机 %s IP地址   ...\n",host_name);
  host = gethostbyname(host_name);
  if (host == NULL)
    {
      printf ("您输入的主机 %s 对应IP地址不能找到。\n",host_name);
    }
  else
    {
      memcpy(&address,host->h_addr,4);
      printf ("您输入的主机 %s IP地址是 -> %s\n",host_name,inet_ntoa(address));
    }
  return 0;
}

                     /* netdb.h */

//  struct hostent {
//    char  *h_name;            /* official name of host */
//    char **h_aliases;         /* alias list */
//    int    h_addrtype;        /* host address type */
//    int    h_length;          /* length of address */
//    char **h_addr_list;       /* list of addresses */
//  }

//   struct hostent *gethostbyname(const char *name);
//   char *inet_ntoa(struct in_addr in);

//   查看socket:
//             /proc/*/fd/*
//             File descriptors.
//
//             /proc/net/tcp
//                   List of TCP sockets.
//
//             /proc/net/udp
//                   List of UDP sockets.
//
//             /proc/net/raw
//                   List of raw sockets.
