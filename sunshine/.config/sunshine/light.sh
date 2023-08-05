ALACRITTY_PATH="$HOME/Dotfiles/alacritty/.config/alacritty/"
NVIM_THEME_FILE="$HOME/Dotfiles/neovim/.config/nvim/after/plugin/theme.lua"
LIBRE_OFFICE_CONFIG_FILE="$HOME/.config/libreoffice/4/user/registrymodifications.xcu"
MY_DESKTOP_FILE_PATH="$HOME/Apps/DesktopFiles/"
SYS_DESKTOP_FILE_PATH="$HOME/.local/share/applications/"

# Alacritty
cd "$ALACRITTY_PATH"
rm colors.yml
ln -s light.yml colors.yml

# Nvim
sed -i "21s/dark/light/g" $NVIM_THEME_FILE

# GTK
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'

# LibreOffice
for line in $(rg "CurrentColorScheme" $LIBRE_OFFICE_CONFIG_FILE -n -m 2| choose -f ":" 0)
do 
    sed -i "${line}s/>LibreOffice Dark</>LibreOffice</g" $LIBRE_OFFICE_CONFIG_FILE
done

# Ungoogled Chromium
FILE="ungoogled-chromium"
EXT=".desktop"
rm "${SYS_DESKTOP_FILE_PATH}/${FILE}${EXT}"
rm "${SYS_DESKTOP_FILE_PATH}/${FILE}-private${EXT}"
ln -s "${MY_DESKTOP_FILE_PATH}/${FILE}-light${EXT}" "${SYS_DESKTOP_FILE_PATH}/${FILE}${EXT}"
ln -s "${MY_DESKTOP_FILE_PATH}/${FILE}-private-light${EXT}" "${SYS_DESKTOP_FILE_PATH}/${FILE}-private${EXT}"

# Debug Notification
# notify-send "Ligth Mode by Light.sh"