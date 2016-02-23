# Maintainer: Luca Weiss <WEI16416@spengergasse.at>
pkgname=python-pkgbuild-git
pkgver=r3.aeca84e
pkgrel=1
pkgdesc="Python library to parse pacman's .SRCINFO file"
arch=('any')
url="https://github.com/z3ntu/python-pkgbuild"
license=('MIT')
depends=('python')
options=(!emptydirs)
source=(git+https://github.com/z3ntu/python-pkgbuild)
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/python-pkgbuild"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/python-pkgbuild"
  python setup.py install --root="$pkgdir/" --optimize=1
}

