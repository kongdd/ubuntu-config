
```r
# INSTALL_opts = c('--no-lock')
install.packages("xml", dependencies=TRUE, INSTALL_opts = c('--no-lock'))

## 1. fix rstudio-server on 20.04
# sudo ln -s libssl.so libssl.so.1.0.0
# sudo ln -s libcrypto.so libcrypto.so.1.0.0
sudo dpkg -i /mnt/e/WSL/ubuntu_pkgs/libssl1.0.0_1.0.2n-1ubuntu5.3_amd64.deb

## 2. fix htop
# https://github.com/microsoft/WSL/issues/4898#issuecomment-646790723



# wget https://launchpad.net/~rafaeldtinoco/+archive/ubuntu/lp1871129/+files/libc6_2.31-0ubuntu8+lp1871129~1_amd64.deb
# sudo dpkg -i libc6_2.31-0ubuntu8+lp1871129~1_amd64.deb

# # https://discourse.ubuntu.com/t/ubuntu-20-04-and-wsl-1/15291/3
# # apt-mark hold libc6
# sudo apt-mark hold libc6
# sudo apt-mark unhold libc6

# sudo apt --fix-broken install

## 3. fix cdo
sudo strip --remove-section=.note.ABI-tag /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
```

```c
#include <time.h>
#include <unistd.h>

// This restores the old behaviour of nanosleep() to use CLOCK_MONOTONIC.
//
// "POSIX.1 specifies that nanosleep() should measure time against the
// CLOCK_REALTIME clock. However, Linux measures the time using the
// CLOCK_MONOTONIC clock.  This probably does not matter [...]"
//
// # gcc -shared -fPIC -o /usr/local/lib/libnanosleep.so nanosleep.c
// # echo /usr/local/lib/libnanosleep.so >> /etc/ld.so.preload
//
int nanosleep(const struct timespec *req, struct timespec *rem)
{
    return clock_nanosleep(CLOCK_MONOTONIC, 0, req, rem);
}

int usleep(useconds_t usec)
{
    struct timespec req = {
        .tv_sec     = (usec / 1000000),
        .tv_nsec    = (usec % 1000000) * 1000,
    };
    return nanosleep(&req, NULL);
}
```

```bash
# gcc -shared -fPIC -o /usr/local/lib/libnanosleep.so nanosleep.c
# echo /usr/local/lib/libnanosleep.so >> /etc/ld.so.preload
```
