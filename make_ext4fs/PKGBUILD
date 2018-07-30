# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Anatol Pomozov
# Contributor: 謝致邦 <Yeking@Red54.com>
# Contributor: Alucryd <alucryd at gmail dot com>

pkgname=make_ext4fs
pkgver=8.0.0_r17
pkgrel=1
pkgdesc='Android platform tools-fsutils'
arch=(i686 x86_64)
url='http://tools.android.com/'
license=(Apache MIT)
depends=(pcre2)
makedepends=(git clang gtest ruby cmake ninja go)
source=(git+https://android.googlesource.com/platform/system/core#tag=android-$pkgver
        git+https://android.googlesource.com/platform/system/extras#tag=android-$pkgver
        git+https://android.googlesource.com/platform/external/selinux#tag=android-$pkgver
        generate_build.rb
        fix_build_selinux.patch
        canned_revert.patch) # partial revert of system/extras commit aad1accb587aa708012b329c784332dcc9991de6
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '7070e4164b82323c33b23adc4556748b760fb2d521fa81898b45785b5fdc8e77'
            '0109b6050be38e9363dd033de965f9b9d21c2c9fd6419ec525d091ce1929c75d'
            '5ede38e9e542b2c9bb6c7f052363eafbf2d2ea8e26c43165163a510acfbf5625')

prepare() {
  PKGVER=$pkgver ./generate_build.rb > build.ninja

  cd $srcdir/extras
  patch -p1 < ../canned_revert.patch

  cd $srcdir/selinux
  patch -p1 < ../fix_build_selinux.patch
}

build() {
  ninja
}

package(){
  install -m755 -d "$pkgdir"/usr/bin
  install -m755 -t "$pkgdir"/usr/bin make_ext4fs
}
