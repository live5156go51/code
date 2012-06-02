#!/bin/bash
# sets the incoming PTDIR as a system environment variable
# by modifying /etc/profile 

PTDIR=$1
if [ -z $PTDIR ]; then
   echo "Using default directory: /opt/pt"
   PTDIR="/opt/pt"
fi

# check /etc/profile for existance of PT5HOME
PROFILE="/etc/profile" 

# error exit if file does not exist or unreadable
if [ ! -f $PROFILE ]; then
   echo "$PROFILE does not exists"
   exit 1
elif [ ! -r $PROFILE ]; then
   echo "$PROFILE: can not read"
   exit 2
fi

# read contents
CONTENTS=""
EXPORT_EXISTS=0
PT5HOME_EXISTS=0
PT5HOME_FOUND=0
exec 3<&0
exec 0<$PROFILE
while read line
do
  
  # replace existing entries
  PT5HOME_FOUND=`expr match "$line" 'PT5HOME'`
  if [ $PT5HOME_FOUND -gt 0 ]; then
	line="PT5HOME=$PTDIR"
        PT5HOME_EXISTS=1
  fi

  # check for export statement
  if [ $EXPORT_EXISTS -eq 0 ]; then
      EXPORT_EXISTS=`expr match "$line" 'export PT5HOME'`
  fi

  #append the line to the contents
  CONTENTS="$CONTENTS\n$line"
done
exec 0<&3

if [ $PT5HOME_EXISTS -eq 0 ]; then
  CONTENTS="$CONTENTS\nPT5HOME=$PTDIR"
fi

if [ $EXPORT_EXISTS -eq 0 ]; then
  CONTENTS="$CONTENTS\nexport PT5HOME"
fi

echo "Writing PT5HOME environment variable to /etc/profile"
sudo sh -c "echo '$CONTENTS' > /etc/profile"

exit 0 
