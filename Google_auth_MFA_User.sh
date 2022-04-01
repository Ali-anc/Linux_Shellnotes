#!/bin/bash

echo "##### Scan the QRCode below immediately to setup MFA. #####"
echo "##### If you ignore scanning QR code in your terminal, you will not be able to log in to the terminal the next time, as you would not have the verification code. #####"
echo "##### Resizing your terminal may cause issues and QRCode might not work. Use QR code URL in the browse to generate the code.#####"
echo "##### Executed via /usr/local/bin/gauth-login.sh.  Rerun that script to generate a new code. #####"

google-authenticator --allow-reuse -t -f --window-size=3 --no-rate-limit --label=${USER}@servername --issuer=greoupname --secret=/home/${USER}/.google-authenticator

if [ -f "/home/${USER}/.google-authenticator" ];
then
    sed -i '/gauth-login.sh/d' /home/${USER}/.bash_profile
fi
