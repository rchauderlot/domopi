# Domo-pi

## Install Raspbian
1. Download the lastest raspbian image from:

	```
	https://www.raspberrypi.org/downloads/raspbian/
	```
	
	For this purpose, no desktop environment is required, so you could download the image which don't containts the pixel bundle.

2. Format your micro SD using the SD association formatter. You could find it here:

	``` 
	https://www.sdcard.org/downloads/formatter_4/eula_mac/
	```

3. Flash the raspbian image to a micro SD card using dd. If mac os x its being used, this is the command to flash it:

	```
	diskutil unmount /dev/disk3s1
	sudo dd bs=1m if=Downloads/debian_server_For_OrangePizero_v0_9_2.img of=/dev/rdisk3
	```

4. Enable ssh access by creating a empty 'ssh' file in the root of the SD with your local computer.

5. Log in into the raspberry pi. The default credentials are:

	```
	user: pi
	pass: raspberry 
	```
	Remember, change it ;)



6. Update the system by:

	```
	sudo apt-get update
	sudo apt-get upgrade
	```
	
7. Finish tweking the system by excuting the following command.

	```
	raspi-config
	```

## Install no-ip DUC

1. Get the program and compile it:

	```
	wget http://www.no-ip.com/client/linux/noip-duc-linux.tar.gz
	tar zxvf noip-duc-linux.tar.gz
	sudo make
	```

	Then install the program. At this step yu will be prompted to configure the service.
	
	```
	sudo make install
	```
	
	The service can always be reconfigured by;

	```
	sudo noip2 -S
	```
	
2. Create the launch script:

	```
	sudo nano /etc/init.d/noip2
	```
	
	By copiyng:

	```
	#! /bin/sh
	# /etc/init.d/noip2

	# Supplied by no-ip.com
	# Modified for Debian GNU/Linux by Eivind L. Rygge <eivind@rygge.org>
	# Updated by David Courtney to not use pidfile 130130 for Debian 6.
	# Updated again by David Courtney to "LSBize" the script for Debian 7.

	### BEGIN INIT INFO
	# Provides:     noip2
	# Required-Start: networking
	# Required-Stop:
	# Should-Start:
	# Should-Stop:
	# Default-Start: 2 3 4 5
	# Default-Stop: 0 1 6
	# Short-Description: Start noip2 at boot time
	# Description: Start noip2 at boot time
	### END INIT INFO

	# . /etc/rc.d/init.d/functions  # uncomment/modify for your killproc

	DAEMON=/usr/local/bin/noip2
	NAME=noip2

	test -x $DAEMON || exit 0

	case "$1" in
    	start)
    	echo -n "Starting dynamic address update: "
    	start-stop-daemon --start --exec $DAEMON
    	echo "noip2."
    	;;
    	stop)
    	echo -n "Shutting down dynamic address update:"
    	start-stop-daemon --stop --oknodo --retry 30 --exec $DAEMON
    	echo "noip2."
    	;;

    	restart)
    	echo -n "Restarting dynamic address update: "
    	start-stop-daemon --stop --oknodo --retry 30 --exec $DAEMON
    	start-stop-daemon --start --exec $DAEMON
    	echo "noip2."
    	;;

    	*)
    	echo "Usage: $0 {start|stop|restart}"
    	exit 1
	esac
	exit 0
	```
	
	And add it to to the rc.d:
	
	```
	sudo chmod +x /etc/init.d/noip2
	sudo update-rc.d noip2 defaults
	```

3. Check the configuration by:

	```
	sudo noip2 -S
	```
	
## Opening ports with upnp if available

1. Install the upnp client:

	```
	sudo apt-get install miniupnpc
	```

2. Create your redirections script:

	```
	sudo nano /usr/local/bin/upnp_nat_redirect_config.sh
   ```
   
   Please, take this as an example:

	```
	#!/bin/bash
	upnpc -e 'Domo Pi SSH' -a $(ip route get 8.8.8.8 | head -1 | awk '{ print $NF }') 22 2222 tcp > /dev/null
	```
	
3. Make it executable:

	```
	sudo chmod a+x /usr/local/bin/upnp_nat_redirect_config.sh
	```
4. Add it to te cron tab:
	
	```
	sudo crontab -e
	```
	
	By adding those lines to execute it at reboot and every 30 min:
	
	```
	*/30 * * * * /usr/local/bin/upnp_nat_redirect_config.sh
	@reboot /usr/local/bin/upnp_nat_redirect_config.sh
   ```
   
5. Check config by:

   ```
	upnpc -l
	```

## Intall homebridge

1. Follow this instructions:

	```
	sudo apt-get install -y build-essential curl
 	sudo apt-get install gcc g++ make git
 	curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
 	sudo apt-get update 
 	sudo apt-get install yarn
 	curl -sL https://deb.nodesource.com/setup_10.x | 	sudo -E bash -
 	sudo apt-get update
 	sudo apt-get install libavahi-compat-libdnssd-dev
 	sudo apt-get install -y nodejs npm node-semver
 	sudo npm install -g --unsafe-perm homebridge
   ```
   
   