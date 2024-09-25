# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Gabriele Musco <emaildigabry@gmail.com>

pkgname=('openrazer-daemon-git' 'openrazer-driver-dkms-git' 'openrazer-meta-git' 'python-openrazer-git')
pkgbase=openrazer-git
_pkgbase=openrazer
pkgver=3.8.0.r34.gd52042ab
pkgrel=1
pkgdesc='Community-led effort to support Razer peripherals on Linux (git version)'
arch=('any')
url=https://openrazer.github.io
license=('GPL-2.0-or-later')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/openrazer/openrazer.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgbase"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # Do a sanity check in the environment of the builder so the build process doesn't place files into a wrong directory.
  # If you think this is incorrect you can always remove this from the PKGBUILD, but then please don't complain if it doesn't work.
  if [ "$(which python3)" != "/usr/bin/python3" ]; then
    echo "ERROR: Your 'python3' does not point to /usr/bin/python3 but to $(which python3), likely a custom environment like anaconda."
    echo "Please build this package in a clean chroot (e.g. with https://wiki.archlinux.org/title/DeveloperWiki:Building_in_a_clean_chroot) or point your PATH variable to prefer /usr/bin/ temporarily."
    return 1
  fi
}

package_openrazer-daemon-git() {
  pkgdesc='Userspace daemon that abstracts access to the kernel driver. Provides a DBus service for applications to use'
  depends=(
    'libnotify'
    'openrazer-driver-dkms'
    'python-daemonize'
    'python-dbus'
    'python-gobject'
    'python-pyudev'
    'python-setproctitle'
    'xautomation'
  )
  provides=('openrazer-daemon')
  conflicts=('openrazer-daemon')
  install=openrazer-daemon-git.install

  cd "$_pkgbase"
  make DESTDIR="$pkgdir" daemon_install
}

package_openrazer-driver-dkms-git() {
  pkgdesc='OpenRazer kernel modules sources'
  depends=('dkms')
  provides=('openrazer-driver-dkms')
  conflicts=('openrazer-driver-dkms')
  install=openrazer-driver-dkms-git.install

  cd $_pkgbase
  make DESTDIR="$pkgdir" setup_dkms udev_install
}

package_openrazer-meta-git() {
  pkgdesc="Meta package for installing all required openrazer packages."
  depends=('openrazer-driver-dkms' 'openrazer-daemon' 'python-openrazer')
  optdepends=('polychromatic: frontend'
              'razergenie: qt frontend'
              'razercommander: gtk frontend')
  provides=('openrazer-meta')
  conflicts=('openrazer-meta')
}

package_python-openrazer-git() {
  pkgdesc='Library for interacting with the OpenRazer daemon'
  depends=('openrazer-daemon' 'python-numpy')
  provides=('python-openrazer')
  conflicts=('python-openrazer')

  cd $_pkgbase
  make DESTDIR="$pkgdir" python_library_install
}
