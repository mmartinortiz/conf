set -g theme_powerline_fonts yes
set -g theme_color_scheme solarized-dark
set -g theme_nerd_fonts yes
set -g theme_display_date no
set -g theme_nerd_fonts yes

set -Ux EDITOR $(which vim)
set -Ux SUDO_EDITOR $(which vim)
set -Ux SYSTEM_EDITOR $(which vim)

fish_add_path ~/.local/bin

# Install Solarized colors
if not test -d $HOME/Projects/dircolors-solarized
  mkdir -p $HOME/Projects
  git clone https://github.com/seebi/dircolors-solarized $HOME/Projects/dircolors-solarized
end

eval (dircolors -c $HOME/Projects/dircolors-solarized/dircolors.ansi-universal)

# Replace 'cat' with 'batchat'
if which batcat > /dev/null;
  alias oldcat $(which cat)
  alias cat "batcat"
end

# Enable VI key bindings
if test -n "$TERM"
  fish_vi_key_bindings
end

