/*
 *输入互联网主机名，获取IP地址
 *编译：gcc *.c -o ggetip  `pkg-config --cflags gtk+-3.0`  `pkg-config --libs gtk+-3.0`
 *author:junstrix
 *email:junstrix@gmail.com
 *date: 2011-9-25  
 */
#include <gtk/gtk.h>

/* for sockets */
#include <string.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <netdb.h>

GdkPixbuf *create_pixbuf(const gchar *data)
{
  GdkPixbuf *pixbuf;
  GError *error = NULL;
  pixbuf = gdk_pixbuf_new_from_file(data,&error);
  if(!pixbuf){
    fprintf(stderr,"%s\n",error->message);
    g_error_free(error);	
  }
  return pixbuf;
}

static gboolean Txt_serch_event (GtkWidget *widget,
				 gpointer   data)
{
  GtkWidget *labell;
  struct hostent *host;
  struct in_addr address;
  const gchar *host_name;

  host_name = gtk_entry_get_text(GTK_ENTRY(data));  
  host = gethostbyname(host_name);

  if(host == NULL){
    g_print("host %s can't be find.\n",host_name);
  }
  else{
    memcpy(&address,host->h_addr,4);
    g_print("Input domain is %s -- Converted ip address is: %s\n",host_name,inet_ntoa(address));
    //		gtk_label_set_text(GTK_LABEL(label),inet_ntoa(address));
  }
  return TRUE;	
}
int main(int argc, char *argv[])
{
  GtkWidget	*window,    *grid,    *label,    *txt_input,    *button1,    *button2;

  gtk_init(&argc,&argv);

  window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
  gtk_window_set_title(GTK_WINDOW(window),"Get ip from domainname  --by junstrix"); //Set window title
  //	gtk_window_set_default_size(GTK_WINDOW(window),200,200);
  gtk_window_set_position(GTK_WINDOW(window),GTK_WIN_POS_CENTER);
  gtk_window_set_icon(GTK_WINDOW(window),create_pixbuf("/tmp/ktip-bulb.png"));

  g_signal_connect(window,"destroy",G_CALLBACK(gtk_main_quit),NULL); //event
  gtk_container_set_border_width(GTK_CONTAINER(window),20);

  grid = gtk_grid_new();
  gtk_container_add(GTK_CONTAINER(window),grid);
	
  txt_input = gtk_entry_new();
  gtk_entry_set_max_length(GTK_ENTRY(txt_input),50);
  g_signal_connect(txt_input,"activate",G_CALLBACK(Txt_serch_event),txt_input);
  gtk_grid_attach(GTK_GRID(grid),txt_input,0,0,4,1);//void gtk_grid_attach (GtkGrid *grid, GtkWidget *child, gint left, gint top, gint width, gint height);

  button1 = gtk_button_new_with_label("查找");
  g_signal_connect(button1,"clicked",G_CALLBACK(Txt_serch_event),txt_input);
  gtk_grid_attach(GTK_GRID(grid),button1,0,1,2,1);

  button2 = gtk_button_new_with_label("退出");
  g_signal_connect(button2,"clicked",G_CALLBACK(gtk_main_quit),NULL);
  gtk_grid_attach(GTK_GRID(grid),button2,2,1,2,1);
	
  label = gtk_label_new("输入域名然后查找相应IP地址");
  gtk_grid_attach(GTK_GRID(grid),label,0,2,4,2);	
  gtk_widget_show_all(window);

  gtk_main();
  return 0;
}
