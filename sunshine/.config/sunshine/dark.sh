# TODO: Refactor this file and make common functions

BAT_CONFIG_FILE="$HOME/Dotfiles/bat/.config/bat/config"
ALACRITTY_PATH="$HOME/Dotfiles/alacritty/.config/alacritty/"
NVIM_THEME_FILE="$HOME/Dotfiles/neovim/.config/nvim/after/plugin/theme.lua"
LIBRE_OFFICE_CONFIG_FILE="$HOME/.config/libreoffice/4/user/registrymodifications.xcu"
MY_DESKTOP_FILE_PATH="$HOME/Apps/DesktopFiles/"
SYS_DESKTOP_FILE_PATH="$HOME/.local/share/applications/"

# Alacritty
cd "$ALACRITTY_PATH"
rm colors.toml
ln -s dark.toml colors.toml

# Nvim
sed -i "21s/light/dark/g" $NVIM_THEME_FILE

# GTK
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# LibreOffice
for line in $(rg "CurrentColorScheme" $LIBRE_OFFICE_CONFIG_FILE -n -m 2 | choose -f ":" 0)
do 
    sed -i "${line}s/>LibreOffice</>LibreOffice Dark</g" $LIBRE_OFFICE_CONFIG_FILE
done

# Bat
for line in $(rg "theme=" $BAT_CONFIG_FILE -n -m 1 | choose -f ":" 0)
do 
    sed -i "${line}s/GitHub/1337/g" $BAT_CONFIG_FILE
done

# Ungoogled Chromium
FILE="ungoogled-chromium"
EXT=".desktop"
rm "${SYS_DESKTOP_FILE_PATH}/${FILE}${EXT}"
rm "${SYS_DESKTOP_FILE_PATH}/${FILE}-private${EXT}"
ln -s "${MY_DESKTOP_FILE_PATH}/${FILE}-dark${EXT}" "${SYS_DESKTOP_FILE_PATH}/${FILE}${EXT}"
ln -s "${MY_DESKTOP_FILE_PATH}/${FILE}-private-dark${EXT}" "${SYS_DESKTOP_FILE_PATH}/${FILE}-private${EXT}"

# Debug Notification
# notify-send "Dark Mode by Dark.sh"
