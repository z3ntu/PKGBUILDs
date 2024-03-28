# Maintainer: Dimitri Merejkowsky <dimitri at dmerej.info>
# https://wiki.archlinux.org/index.php/Rust_package_guidelines

pkgname=agate
pkgver=3.3.6
pkgrel=1
pkgdesc="Simple static file server for the Gemini network protocol, written in Rust"
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
arch=('x86_64')
url="https://github.com/mbrubeck/agate"
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
license=('APACHE' 'MIT')
options=("!lto") # see: https://github.com/briansmith/ring/issues/1444

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release --all-features
 }

package() {
    cd $pkgname-$pkgver
    install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
    install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
sha256sums=('a55fb0a6179de902ca7ed54763c975d16e5e4dcaa97ccc9085a320f8e9f57bc7')
