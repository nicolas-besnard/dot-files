brew install emacs --use-git-head --cocoa --srgb
brew install cask
cat <<EOF >> ~/.emacs.d/Cask
(source melpa)
(depends-on "pallet")
EOF
cd ~/.emacs.d/
cask
cd -
cp .emacs ~/

