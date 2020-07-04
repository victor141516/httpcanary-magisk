# HttpCanary System CA Mounter

In recent versions of Android, [HttpCanary](https://play.google.com/store/apps/details?id=com.guoshi.httpcanary&hl=es) cannot copy the CA certificate to system because `/system` is read-only. This module simply puts the certificate where it should be.
