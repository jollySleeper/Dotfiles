-- NOTE: This Will Only Change Color Scheme on Startup
local my_theme = "dark"; -- Fallback to Dark Theme

-- For Automating Based On User Preffered Time
-- Uncomment the following Code
-- local currentTime = os.time();
-- local hour = tonumber(os.date('%H', currentTime));
-- local min = tonumber(os.date('%M', currentTime));
--
-- if (hour > 6 and (hour < 17 and min < 30)) then
--     my_theme = "light";
-- else
--     my_theme = "dark";
-- end

-- Automating Theme Switching using Gnome Tweaks Extensions
-- On Theme Change Toggle this will file will be written.
-- Line 21 will be Written Using `sed` Command
-- `sed -i "21s/dark/light/g" $HOME/.config/nvim/after/plugin/theme.lua`
-- `sed -i "21s/dark/light/g" $HOME/.config/nvim/after/plugin/theme.lua`
my_theme = "dark"; -- Automated Line

local bg_color = "#24292e" -- Dark Theme Color
-- Setting Custom BG for Light Theme
if my_theme == "light" then
    bg_color = "#f3f2f1" -- Same as Alacritty
end

require("github-theme").setup({
    theme_style = my_theme,
    colors = {
        bg =  bg_color
    }
});



