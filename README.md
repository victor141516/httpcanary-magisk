# HttpCanary System CA Mounter

In recent versions of Android, [HttpCanary](https://play.google.com/store/apps/details?id=com.guoshi.httpcanary&hl=es) cannot copy the CA certificate to system because `/system` is read-only. 

This module handles all the certificates stuff.

## Usage

1. Install HttpCanary from the Play Store ([free](https://play.google.com/store/apps/details?id=com.guoshi.httpcanary) or [premium](https://play.google.com/store/apps/details?id=com.guoshi.httpcanary.premium)) or use my backup: https://t.me/random_stuff_of_mine/110
2. Open the app and go through the installation assistant until you get the certificate error.
3. Install the module: https://github.com/victor141516/httpcanary-magisk/raw/master/install.zip
4. Reboot
5. Open HttpCanary and go to Settings --> HttpCanary Root CA Settings --> Add as system-trusted(Root). Click on Move
6. If a message with the text "Congratulations, ..." pops, it means everything is working!!
7. Use the app as usual
