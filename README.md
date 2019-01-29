# Public made available scripts

**Author:** Duubar Villalobos

**Email:** mydvtech@gmail.com

# Description

The short link for **my-server-setup.sh** is: https://git.io/fAEsZ

A great way to download and execute the above scrip from terminal will be by excuting:

```
$ cd /tmp
$ wget https://git.io/fAEsZ
$ mv fAEsZ my-server-setup.sh
$ chmod +x my-server-setup.sh
$ ./my-server-setup.sh
```


# In case of ssh failure
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED! @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!

 Just remove the key for the host name

```
 # From Linux
 $ ssh-keygen -R <host>

# From Chrome OS
# ChromeOS – removing SSH known_hosts from Chromebook
# Open the JavaScript console (CTRL +Shift +J) and type the following into the console.
# To clear all the known hosts:
 > term_.command.removeAllKnownHosts();
```
