#	Disable and kill listening services on Asus routers
#	enable telnet, then login
telnet 192.168.1.1 23

#turn spanning tree protocol off(if you don't need it, which most of you won't at home)
nvram set lan_stp=0
nvram set lan0_stp=0
#disable USB printer (Most printers are wireless these days, no need to be tethered to router, nor sharing the printers drive with the web over FTP!!)
nvram set usb_printer=0
#disable wan down redirect page (This can also be done in the admin panel, but just set here while in)
nvram set web_redirect=0
#commit channges
nvram commit
reboot

#Then kill all these running programs
killall -9 nas #network attached storage, kill if not using
killall -9 u2ec #usb to Ethernet connector, who uses this???
killall -9 wanduck	#fuck a duck, unless you have more than one WAN, kill this
killall -9 wpsaide	#wireless protected shite, STFU, GTFO
killall -9 mDNSNetMonitor #no apple shite on my network!
service stop_lpd #line printer services on a router. why? I'm not printing or logging shite
#now run netstat
netstat -antlu	#DNS and your HTTPS port for administration are all you need. port 23 can close after you disable telnet again.
#you should now have quieted down your router and closed unnecessary ports
#rebooting will start the programs above, but not the nvram set items, kill them each reboot to close those ports
#if you find any of these issues cause problems for you, then reverse the nvram set to 1, reboot, all should be back to default.
