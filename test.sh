make >> log.txt
sudo insmod ./timer_sysfs.ko

echo "testing 1 second period:"
echo 1000 >> /sys/timer_dir/timer_period
sleep 3
dmesg | tail -n 5

echo "testing 0.5 second period:"
echo 500 >> /sys/timer_dir/timer_period
sleep 2
dmesg | tail -n 5

echo "testing 0 second period (stop timer):"
echo 0 >> /sys/timer_dir/timer_period
sleep 2
dmesg | tail -n 5

sudo rmmod timer_sysfs
make clean >> log.txt

