# Check free or premium
if ! test -d /data/data/com.guoshi.httpcanary && ! test -d /data/data/com.guoshi.httpcanary.premium; then
  echo "Could not find an HttpCanary installation"
  exit 1
fi
test -d /data/data/com.guoshi.httpcanary && PACKAGE_ID=com.guoshi.httpcanary
test -d /data/data/com.guoshi.httpcanary.premium && PACKAGE_ID=com.guoshi.httpcanary.premium

# Remove password from p12
cp /data/data/$PACKAGE_ID/cache/HttpCanary.p12 /data/local/tmp/HttpCanary-protected.p12
$MODPATH/common/openssl pkcs12 -in /data/data/$PACKAGE_ID/cache/HttpCanary.p12 -passin pass:HttpCanary -nodes -out /data/local/tmp/temp.pem
$MODPATH/common/openssl pkcs12 -export -in /data/local/tmp/temp.pem -passout pass: -out /data/local/tmp/HttpCanary-unprotected.p12
rm /data/local/tmp/temp.pem /data/local/tmp/HttpCanary-protected.p12
mv /data/local/tmp/HttpCanary-unprotected.p12 /data/local/tmp/HttpCanary.p12
chmod o+r /data/local/tmp/HttpCanary.p12

# Install cert (user must select VPN)
am start -n com.android.certinstaller/.CertInstallerMain -a android.intent.action.VIEW -t application/x-pkcs12 -d 'file:///data/local/tmp/HttpCanary.p12' -e name HttpCanary

# Mandatory files
touch /data/data/$PACKAGE_ID/cache/HttpCanary.jks
cp /data/data/$PACKAGE_ID/cache/HttpCanary.pem /data/data/$PACKAGE_ID/cache/87bc3517.0

# Copy pem for Magisk to mount
mkdir -p $MODPATH/system/etc/security/cacerts
cp /data/data/$PACKAGE_ID/cache/HttpCanary.pem $MODPATH/system/etc/security/cacerts/87bc3517.0
