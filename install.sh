#!/bin/bash
HOME_PATH=/home/$USER

HYPR=$HOME_PATH/.config/hypr
ROFI=$HOME_PATH/.config/rofi
ASHELL=$HOME_PATH/.config/ashell
WALLPAPER_DIR=$HOME_PATH/Wallpapers

validate_install_paths() {
    local _path=$1
    [[ -d "$_path" ]];
}


validate_file_exists() {
    local _filename=$1
    [[ -f "$_filename" ]]
}

echo "Installer for Dystic's Hyprland setup"
echo "Validating deps"

if validate_file_exists "/usr/bin/yay"; then
    echo "Yay already installed"
else
    echo "Yay not found, installing"
    bash -c 'sudo pacman -S yay'
fi

if validate_file_exists "/usr/bin/rofi"; then
    echo "Rofi already installed"
else
    echo "Rofi not installed, installing now"
    bash -c 'sudo pacman -S rofi';
fi

if validate_file_exists "/usr/bin/ashell"; then
    echo "Ashell already installed"
else
    echo "Ashell not installed, installing now"
    bash -c 'yay -S ashell'
fi


if validate_file_exists "/usr/bin/dolpin"; then
    echo "KDE Dolphin already installed"
else
    echo "KDE Dolpin not installed, installing now"
    bash -c 'sudo pacman -S dolphin'
fi

if validate_file_exists "/usr/bin/kitty"; then
    echo "Kitty already installed"
else
    echo "Kitty not installed, installing now"
    bash -c 'sudo pacman -S kitty'
fi

if validate_file_exists "/usr/bin/flatpak"; then
    echo "flatpak already installed"
else
    echo "flatpak not installed, installing now"
    bash -c 'sudo pacman -S flatpak'
fi

if validate_file_exists "/usr/bin/grim"; then
    echo "grim already installed"
else
    echo "grim not installed, installing now"
    bash -c 'sudo pacman -S grim'
fi

if validate_file_exists "/usr/bin/slurp"; then
    echo "slurp already installed"
else
    echo "slurp not installed, installing now"
    bash -c 'sudo pacman -S slurp'
fi


echo "Installing wallpaper utility"
bash -c 'yay -S awww-git'
echo "installing zen browser"


bash -c 'flatpak install app.zen_browser.zen'
bash -c 'flatpak install flathub com.github.tchx84.Flatseal'


echo "Creating Wallpaper directory"
mkdir "$WALLPAPER_DIR"

if validate_install_paths "$ROFI"; then
    echo "Rofi config path: $ROFI"
else
    echo "No rofi config folder found"
    echo "Creating one now"
    mkdir "$ROFI"
fi

if validate_install_paths "$ASHELL"; then
    echo "ASHELL Config path: $ASHELL"
else
    echo "No ASHELL config folder found"
    echo "Creating one now"
    mkdir "$ASHELL"
fi


if validate_install_paths "$HYPR"; then
    echo "Hyprland path: $HYPR"
else
    echo "Please check the location of the Hypr File path in the install.sh file"
    echo "Current set path: $HYPR"
fi


# echo "Moving DotFiles now"
cp ./dotfiles/img/minimal.jpg "$HOMEPATH/Wallpapers/"
cp -r ./dotfiles/* "$HOME_PATH/.config/"


echo "To enable hardware accleration, allow access to your downloads folder etc. Please run Flatseal"
echo "Command: flatpak run com.github.tchx84.Flatseal"
