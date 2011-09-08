#include <stdio.h>
#include <stdlib.h>
#include <libnet.h>
int main(int argc, char *argv[])
{
  libnet_t *l;
  char errbuf[LIBNET_ERRBUF_SIZE];
  if (argc == 1)
    {
      fprintf(stderr,"Usage: %s device\n",errbuf);
      exit(EXIT_FAILURE);
    }
  l = libnet_init(LIBNET_RAW4,argv[1],errbuf);
  if (l == NULL)
    {
      fprintf(stderr,"libnet_init() error: %s\n",errbuf);
      exit(EXIT_FAILURE);
    }
  libnet_destroy(l);
  return 0;
}
