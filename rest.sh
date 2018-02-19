    echo -e "[ \033[1m\033[96mpink\033[m ] Raspberry Pi Zero shield support is enabled ---------------------------"
    cmake -DCMAKE_BUILD_TYPE=Release -DUSE_PI_ZERO=ON -DUSE_WEBSOCKET=OFF -DJUST_INSTALL_CEREAL=ON ..
make
if [ $platform == "linux-rpi" ];
  then
    sudo make install
    sudo update-rc.d pink defaults
fi
cd ..

echo ""
echo ""
echo ""
echo -e "[ \033[1m\033[96mpink\033[m ] Update device configuration -------------------------------------------"
if [ $platform == "linux-rpi" ];
  then
    sudo cp --backup=numbered support/hostapd.conf /etc/hostapd/.
    sudo cp -r support/html/* /var/www/html/.
    amixer set PCM 100%
    sudo alsactl store
fi

echo ""
echo ""
echo ""
echo -e "[ \033[1m\033[96mpink\033[m ] Optimize system configuration -----------------------------------------"
if [ $platform == "linux-rpi" ];
  then
    echo -n performance | sudo tee /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
fi

echo ""
echo ""
echo ""
if [ $platform == "linux-rpi" ];
  then
    echo -e "[ \033[1m\033[96mpink\033[m ] Installation completed, please reboot now."
  else
    echo -e "[ \033[1m\033[96mpink\033[m ] Build completed"
fi
echo ""
echo ""
echo ""
