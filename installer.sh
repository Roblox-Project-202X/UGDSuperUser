#!/bin/bash

curl -o "$TMPDIR/dsuperuser" https://raw.githubusercontent.com/Roblox-Project-202X/UGDSuperUser/refs/heads/main/dsuperuser

curl -o "$TMPDIR/tsu-sudo" https://raw.githubusercontent.com/Roblox-Project-202X/UGDSuperUser/refs/heads/main/tsu-sudo

mkdir -p "$HOME/.dsuperuser/bin"

rm -rf "$HOME/.dsuperuser/bin/su"
rm -rf "$HOME/.dsuperuser/bin/tsu"
rm -rf "$HOME/.dsuperuser/bin/dsuperuser"
rm -rf "$HOME/.dsuperuser/bin/sudo"

install -Dm755 "$TMPDIR/dsuperuser" "$HOME/.dsuperuser/bin/dsuperuser"

install -Dm755 "$TMPDIR/tsu-sudo" "$HOME/.dsuperuser/bin/tsu"

ln -ds "$HOME/.dsuperuser/bin/dsuperuser" "$HOME/.dsuperuser/bin/su"

ln -ds "$HOME/.dsuperuser/bin/dsuperuser" "$HOME/.dsuperuser/bin/sudo"

export PATH="$HOME/.dsuperuser/bin:$PREFIX/bin:$PATH"

if ! grep -Fxq "export PATH=\"$HOME/.dsuperuser/bin:$PREFIX/bin:\$PATH\"" "$HOME/.bashrc"; then
    echo "export PATH=\"$HOME/.dsuperuser/bin:$PREFIX/bin:\$PATH\"" >> "$HOME/.bashrc"
fi

# source "$HOME/.bashrc"

# pkg i libsqlite -y
echo
echo "Đã cài đặt thành công dsuperuser!"
echo "Bạn có thể sử dụng lệnh 'dsuperuser su' hoặc 'su' để truy cập quyền root."
echo "Nếu bạn muốn sử dụng lệnh 'sudo', hãy sử dụng lệnh 'sudo'."
echo "Để sử dụng 'tsu' (termux sudo), hãy sử dụng lệnh 'tsu'."
echo

