#!/bin/bash
# yong input method
# author dgod

cd "$(dirname "$0")"

HOST_MACHINE=
PATH_LIB32=
PATH_LIB64=
HOST_TRIPLET32=
HOST_TRIPLET64=
IBUS_STATUS=
GTK2_IMMODULES32=
GTK2_IMMODULES64=

usage()
{
	echo "yong-tool.sh [OPTION]"
	echo "  --install		install yong at system"
	echo "  --uninstall		uninstall yong from system"
	echo "  --select		select yong as default IM"
	echo "  --sysinfo		display system infomation"
}

fedora_install()
{
	if [ -e /usr/bin/imsettings-info ] ; then
		CFG=/etc/X11/xinit/xinput.d/yong.conf

	cat >$CFG <<EOF
XMODIFIERS="@im=yong"
XIM="yong"
XIM_PROGRAM="/usr/bin/yong"
XIM_ARGS=""
if [ -e /usr/lib/gtk-2.0/*/immodules/im-yong.so ] ; then
	GTK_IM_MODULE="yong"
else
	GTK_IM_MODULE="xim"
fi
QT_IM_MODULE="xim"
ICON="`pwd`/skin/tray1.png"
SHORT_DESC="yong"
PREFERENCE_PROGRAM="/usr/bin/yong-config"
EOF

	elif [ -e /etc/X11/xinit/xinputrc ] ; then
		CFG=/etc/X11/xinit/xinput.d/yong.conf

	cat >$CFG <<EOF
XMODIFIERS="@im=yong"
XIM="yong"
XIM_PROGRAM="/usr/bin/yong"
XIM_ARGS=""
XIM_ARGS=""
if [ -e /usr/lib/gtk-2.0/*/immodules/im-yong.so ] ; then
	GTK_IM_MODULE="yong"
else
	GTK_IM_MODULE="xim"
fi
QT_IM_MODULE="xim"
SHORT_DESC="yong"
PREFERENCE_PROGRAM="/usr/bin/yong-config"
EOF

	else
		CFG=/etc/X11/xinit/xinitrc.d/yong.sh

	cat >$CFG <<EOF
[ -z "$XIM" ] && export XIM=yong
[ -z "$XMODIFIERS" ] && export XMODIFIERS="@im=$XIM"
if [ -z "$GTK_IM_MODULE" ] ; then
	if [ -e /usr/lib/gtk-2.0/*/immodules/im-yong.so ] ; then
		export GTK_IM_MODULE="yong"
	else
		export GTK_IM_MODULE="xim"
	fi
fi
[ -z "$QT_IM_MODULE" ] && export QT_IM_MODULE=xim
[ -z "$XIM_PROGRAM" ] && export XIM_PROGRAM=yong
[ -z "$XIM_ARGS" ] && export XIM_ARGS="-d"
$XIM_PROGRAM $XIM_ARGS
EOF

		chmod +x $CFG
	fi
}

fedora_uninstall()
{
	CFG=/etc/X11/xinit/xinput.d/yong.conf
	rm -rf $CFG
	CFG=/etc/X11/xinit/xinitrc.d/yong.sh
	rm -rf $CFG
}

fedora_select()
{
	CFG=/etc/X11/xinit/xinput.d/yong.conf
	if [ -e $CFG ] ; then
		ln -sf $CFG ~/.xinputrc
	fi
}

debian_install()
{
	CFG=/etc/X11/xinit/xinput.d/yong
	
	cat >$CFG <<EOF
XMODIFIERS="@im=yong"
XIM="yong"
XIM_PROGRAM="/usr/bin/yong"
XIM_ARGS="-d"
if [ -e /usr/lib/gtk-2.0/*/immodules/im-yong.so ] ; then
	GTK_IM_MODULE="yong"
else
	GTK_IM_MODULE="xim"
fi
QT_IM_MODULE="xim"
SHORT_DESC="yong"
PREFERENCE_PROGRAM="/usr/bin/yong-config"
EOF

	update-alternatives \
	       	--install /etc/X11/xinit/xinput.d/zh_CN xinput-zh_CN \
       		/etc/X11/xinit/xinput.d/yong 20
}

debian_uninstall()
{
	CFG=/etc/X11/xinit/xinput.d/yong

	update-alternatives --remove xinput-zh_CN /etc/X11/xinit/xinput.d/yong
	rm -rf $CFG
}

debian_select()
{
	im-switch -s yong
}

suse_install()
{
	CFG=/etc/X11/xim.d/yong

	cat >$CFG <<EOF
XMODIFIERS="@im=yong"
XIM="yong"
XIM_PROGRAM="/usr/bin/yong"
XIM_ARGS=""
if [ -e /usr/lib/gtk-2.0/*/immodules/im-yong.so ] ; then
	GTK_IM_MODULE="yong"
else
	GTK_IM_MODULE="xim"
fi
QT_IM_MODULE="xim"
SHORT_DESC="yong"
PREFERENCE_PROGRAM="/usr/bin/yong-config"
EOF

}

suse_uninstall()
{
	CFG=/etc/X11/xim.d/yong
	rm -rf $CFG
}

suse_select()
{
	CFG=~/.xim

	cat >$CFG <<EOF
XMODIFIERS="@im=yong"
XIM="yong"
XIM_PROGRAM="/usr/bin/yong"
XIM_ARGS=""
if [ -e /usr/lib/gtk-2.0/*/immodules/im-yong.so ] ; then
	GTK_IM_MODULE="yong"
else
	GTK_IM_MODULE="xim"
fi
QT_IM_MODULE="xim"
yong -d
EOF

}

legacy_install()
{
	CFG=~/.xinitrc
}

legacy_uninstall()
{
	CFG=~/.xinitrc
}

legacy_select()
{
	CFG=~/.xinitrc
	echo "add IM config yourself"
}

mandriva_install()
{
	CFG=~/.i18n
}

mandriva_uninstall()
{
	CFG=~/.i18n
	rm -rf $CFG
}

mandriva_select()
{
	CFG=~/.i18n
	
	cat >$CFG <<EOF
XMODIFIERS="@im=yong"
XIM="yong"
XIM_PROGRAM="/usr/bin/yong"
XIM_ARGS=""
if [ -e /usr/lib/gtk-2.0/*/immodules/im-yong.so ] ; then
	GTK_IM_MODULE="yong"
else
	GTK_IM_MODULE="xim"
fi
QT_IM_MODULE="xim"
EOF

}

ibus_install()
{
	IBUS_D=/usr/share/ibus/component
	if [ -d $IBUS_D ] ; then
		sed "s%\/usr\/share\/yong%`pwd`%" yong.xml >$IBUS_D/yong.xml
	fi
}

ibus_uninstall()
{
	if [ -f /usr/share/ibus/component/yong.xml ] ; then
		rm -f /usr/share/ibus/component/yong.xml
	fi
}

gtk_install32()
{
	if ! [ -d gtk-im ] ; then
		return
	fi
	
	if [ -z "$PATH_LIB32" ] ; then
		return
	fi
	
	if [ -f gtk-im/im-yong-gtk2.so ] ; then
		if [ -d $PATH_LIB32/gtk-2.0/2.10.0/immodules ] ; then
			install gtk-im/im-yong-gtk2.so $PATH_LIB32/gtk-2.0/2.10.0/immodules/im-yong.so
		fi
		
		if [ -x /usr/bin/update-gtk-immodules ] ;then
			/usr/bin/update-gtk-immodules $HOST_TRIPLET32
		elif [ -x /usr/bin/gtk-query-immodules-2.0-32 ] ;then
			/usr/bin/gtk-query-immodules-2.0-32 >$GTK2_IMMODULES32
		elif [ -x /usr/bin/gtk-query-immodules-2.0 ] ;then
			/usr/bin/gtk-query-immodules-2.0 >$GTK2_IMMODULES32
		else
			echo "update gtk2-im cache fail"
		fi
	fi
	
	if [ -f gtk-im/im-yong-gtk3.so ] ; then
		if [ -d $PATH_LIB32/gtk-3.0/3.0.0/immodules ] ; then
			install gtk-im/im-yong-gtk3.so $PATH_LIB32/gtk-3.0/3.0.0/immodules/im-yong.so
		fi
		
		if [ -x /usr/bin/gtk-query-immodules-3.0-32 ] ;then
			/usr/bin/gtk-query-immodules-3.0-32 --update-cache
		elif [ -x /usr/bin/gtk-query-immodules-3.0 ] ;then
			/usr/bin/gtk-query-immodules-3.0 --update-cache
		else
			echo "update gtk3-im cache fail"
		fi
	fi
}

gtk_uninstall32()
{
	if [ -z "$PATH_LIB32" ] ; then
		return
	fi
	
	if [ -f $PATH_LIB32/gtk-2.0/2.10.0/immodules/im-yong.so ] ; then
		rm -rf $PATH_LIB32/gtk-2.0/2.10.0/immodules/im-yong.so
		if [ -x /usr/bin/update-gtk-immodules ] ;then
			/usr/bin/update-gtk-immodules $HOST_TRIPLET32
		elif [ -x /usr/bin/gtk-query-immodules-2.0-32 ] ;then
			/usr/bin/gtk-query-immodules-2.0-32 >$GTK2_IMMODULES32
		elif [ -x /usr/bin/gtk-query-immodules-2.0 ] ;then
			/usr/bin/gtk-query-immodules-2.0 >$GTK2_IMMODULES32
		else
			echo "update gtk2-im cache fail"
		fi
	fi
	
	if [ -f $PATH_LIB32/gtk-3.0/3.0.0/immodules/im-yong.so ] ; then
		rm -rf $PATH_LIB32/gtk-3.0/3.0.0/immodules/im-yong.so
		
		if [ -x /usr/bin/gtk-query-immodules-3.0-32 ] ;then
			/usr/bin/gtk-query-immodules-3.0-32 --update-cache
		elif [ -x /usr/bin/gtk-query-immodules-3.0 ] ;then
			/usr/bin/gtk-query-immodules-3.0 --update-cache
		else
			echo "update gtk3-im cache fail"
		fi
	fi
}

gtk_install64()
{
	if ! [ -d l64 ] ; then
		return
	fi

	if ! [ -d l64/gtk-im ] ; then
		return
	fi
	
	if [ -z "$PATH_LIB64" ] ; then
		return
	fi
	
	cd l64
	
	if [ -f gtk-im/im-yong-gtk2.so ] ; then
		if [ -d $PATH_LIB64/gtk-2.0/2.10.0/immodules ] ; then
			install gtk-im/im-yong-gtk2.so $PATH_LIB64/gtk-2.0/2.10.0/immodules/im-yong.so
		fi
	
		if [ -x /usr/bin/update-gtk-immodules ] ;then
			/usr/bin/update-gtk-immodules $HOST_TRIPLET64
		elif [ -x /usr/bin/gtk-query-immodules-2.0-32 ] ;then
			/usr/bin/gtk-query-immodules-2.0-64 >$GTK2_IMMODULES64
		elif [ -x /usr/bin/gtk-query-immodules-2.0 ] ;then
			/usr/bin/gtk-query-immodules-2.0 >$GTK2_IMMODULES64
		else
			echo "update gtk2-im cache fail"
		fi
	fi
	
	if [ -f gtk-im/im-yong-gtk3.so ] ; then
		if [ -d $PATH_LIB64/gtk-3.0/3.0.0 ] ; then
			install gtk-im/im-yong-gtk3.so $PATH_LIB64/gtk-3.0/3.0.0/immodules/im-yong.so
		fi
		
		if [ -x /usr/bin/gtk-query-immodules-3.0-64 ] ; then
			/usr/bin/gtk-query-immodules-3.0-64 --update-cache
		elif [ -x /usr/bin/gtk-query-immodules-3.0 ] ; then
			/usr/bin/gtk-query-immodules-3.0 --update-cache
		else
			echo "update gtk3-im cache fail"
		fi
	fi
	
	cd -
}

gtk_uninstall64()
{
	if [ -z "$PATH_LIB64" ] ; then
		return
	fi
	
	if [ -f $PATH_LIB64/gtk-2.0/2.10.0/immodules/im-yong.so ] ; then
		rm -rf $PATH_LIB64/gtk-2.0/2.10.0/immodules/im-yong.so
		if [ -x /usr/bin/update-gtk-immodules ] ;then
			/usr/bin/update-gtk-immodules $HOST_TRIPLET64
		elif [ -x /usr/bin/gtk-query-immodules-2.0-32 ] ;then
			/usr/bin/gtk-query-immodules-2.0-64 >$GTK2_IMMODULES64
		elif [ -x /usr/bin/gtk-query-immodules-2.0 ] ;then
			/usr/bin/gtk-query-immodules-2.0 >$GTK2_IMMODULES64
		else
			echo "update gtk2-im cache fail"
		fi
	fi
	
	if [ -f $PATH_LIB64/gtk-3.0/3.0.0/immodules/im-yong.so ] ; then
		rm -rf $PATH_LIB64/gtk-3.0/3.0.0/immodules/im-yong.so
		
		if [ -x /usr/bin/gtk-query-immodules-3.0-64 ] ;then
			/usr/bin/gtk-query-immodules-3.0-64 --update-cache
		elif [ -x /usr/bin/gtk-query-immodules-3.0 ] ;then
			/usr/bin/gtk-query-immodules-3.0 --update-cache
		else
			echo "update gtk3-im cache fail"
		fi
	fi
}

gtk_install()
{
	gtk_install32
	gtk_install64
}

gtk_uninstall()
{
	gtk_uninstall32
	gtk_uninstall64
}

display_sysinfo()
{
	echo "sysinfo:";
	echo "  DIST: $DIST"
	echo "  HOST_MACHINE: $HOST_MACHINE"
	echo "  PATH_LIB32: $PATH_LIB32"
	echo "  PATH_LIB64: $PATH_LIB64"
	echo "  HOST_TRIPLET32: $HOST_TRIPLET32"
	echo "  HOST_TRIPLET64: $HOST_TRIPLET64"
	echo "  IBUS_STATUS: $IBUS_STATUS"
	echo "  GTK2_IMMODULES32: $GTK2_IMMODULES32"
	echo "  GTK2_IMMODULES64: $GTK2_IMMODULES64"
}

warn_sysconfig()
{
	if [ "$LANG" = "C" -o "$LANG" = "POSIX" ] ; then
		echo "yong not support C or POSIX locale"
		exit 0;
	fi
}

if [ $# != 1 ] ; then
	usage
	exit 0
fi

warn_sysconfig

if [ -n "$DIST" ] ; then
	echo $DIST forced
else

	DIST=none

	# detect mandriva first, fo mandriva provides redhat-release
	if [ -f /etc/mandriva-release ] ; then
		DIST=mandriva
	elif [ -f /etc/fedora-release ] ; then
		DIST=fedora
	elif [ -f /etc/redhat-release ] ; then
		DIST=fedora
	elif [ -f /etc/centos-release ] ; then
		DIST=fedora
	elif [ -f /etc/redflag-release ] ; then
		DIST=fedora
	elif [ -f /etc/debian-release ] ; then
		DIST=debian
	elif [ -f /etc/SuSE-release ] ; then
		DIST=suse
	elif [ -f /etc/debian_version ] ; then
		DIST=debian
	elif [ `cat /etc/issue | grep Ubuntu | wc -l` != 0 ] ; then
		DIST=debian
	elif [ `cat /etc/issue | grep Mint | wc -l` != 0 ] ; then
		DIST=debian
	elif [ -f /etc/system-release ] ; then
		if [ `cat /etc/system-release | grep YLMF | wc -l` != 0 ] ; then
			DIST=debian
		fi
	else
		DIST=legacy
	fi

	echo DIST $DIST found

	if [ $DIST = "none" ] ; then
		exit 1
	fi

fi

if [ `uname -m | grep 64 |wc -l` = 0 ] ; then
	HOST_MACHINE=32
else
	HOST_MACHINE=64
fi 

if [ -d /usr/lib32 ] ; then
	PATH_LIB32=/usr/lib32
else
	PATH_LIB32=/usr/lib
fi

if [ $HOST_MACHINE -eq 64 ] ; then
	if [ -d /usr/lib64 ] ; then
		PATH_LIB64=/usr/lib64
	else
		PATH_LIB64=/usr/lib
	fi
fi

if [ "$PATH_LIB64" = "$PATH_LIB32" ] ; then
	PATH_LIB32=
fi

if [ $DIST = "fedora" ] ; then
	HOST_TRIPLET32=i386-redhat-linux-gnu
	if ! [ `uname -m | grep 64 |wc -l` = 0 ] ; then
		HOST_TRIPLET64=x86_64-redhat-linux-gnu
	fi
fi

if [ $DIST = "fedora" ] ; then
	GTK2_IMMODULES32=/etc/gtk-2.0/$HOST_TRIPLET32/gtk.immodules
	if [ $HOST_MACHINE -eq 64 ] ; then
		GTK2_IMMODULES64=/etc/gtk-2.0/$HOST_TRIPLET64/gtk.immodules
	fi
else 
	if [ -e /etc/gtk-2.0/gtk.immodules ] ; then
		GTK2_IMMODULES32=/etc/gtk-2.0/gtk.immodules
		if [ $HOST_MACHINE -eq 64 ] ; then
			GTK2_IMMODULES64=/etc/gtk-2.0/gtk.immodules
		fi
	else
		GTK2_IMMODULES32=$PATH_LIB32/gtk-2.0/2.10.0/gtk.immodules
		if [ $HOST_MACHINE -eq 64 ] ; then
			GTK2_IMMODULES64=$PATH_LIB64/gtk-2.0/2.10.0/gtk.immodules
		fi
	fi
fi

if [ -d /usr/share/ibus/component ] ; then
	IBUS_STATUS=1
else
	IBUS_STATUS=0
fi

if [ $1 = "--install" ] ; then
	ln -sf `pwd`/yong /usr/bin/yong
	ln -sf `pwd`/yong-config /usr/bin/yong-config
	ibus_install
	gtk_install
	if [ $DIST = "fedora" ] ; then
		fedora_install
	elif [ $DIST = "debian" ] ; then
		debian_install
	elif [ $DIST = "suse" ] ; then
		suse_install
	elif [ $DIST = "mandriva" ] ; then
		mandriva_install
	elif [ $DIST = "legacy" ] ; then
		legacy_install
	fi
elif [ $1 = "--install64" ] ; then
	if [ `uname -m | grep 64 |wc -l` = 0 ] ; then
		echo "not 64bit system"
		exit 1
	fi 
	if ! [ -d l64 ] ; then
		echo "no l64 found"
		exit 1
	fi
	cp -f l64/* ./
	ln -sf `pwd`/yong /usr/bin/yong
	ln -sf `pwd`/yong-config /usr/bin/yong-config
	ibus_install
	gtk_install
	if [ $DIST = "fedora" ] ; then
		fedora_install
	elif [ $DIST = "debian" ] ; then
		debian_install
	elif [ $DIST = "suse" ] ; then
		suse_install
	elif [ $DIST = "mandriva" ] ; then
		mandriva_install
	elif [ $DIST = "legacy" ] ; then
		legacy_install
	fi
elif [ $1 = "--uninstall" ] ; then
	rm -rf /usr/bin/yong
	rm -rf /usr/bin/yong-config
	ibus_uninstall
	gtk_uninstall
	if [ $DIST = "fedora" ] ; then
		fedora_uninstall
	elif [ $DIST = "debian" ] ; then
		debian_uninstall
	elif [ $DIST = "suse" ] ; then
		suse_uninstall
	elif [ $DIST = "mandriva" ] ; then
		mandriva_uninstall
	elif [ $DIST = "legacy" ] ; then
		legacy_uninstall
	fi
elif [ $1 = "--select" ] ; then
	if [ $DIST = "fedora" ] ; then
		fedora_select
	elif [ $DIST = "debian" ] ; then
		debian_select
	elif [ $DIST = "suse" ] ; then
		suse_select
	elif [ $DIST = "mandriva" ] ; then
		mandriva_select
	elif [ $DIST = "legacy" ] ; then
		legacy_select
	fi
elif [ $1 = "--sysinfo" ] ; then
	display_sysinfo
fi

echo "$1 Done"
