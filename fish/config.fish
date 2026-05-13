if status is-interactive
    # Commands to run in interactive sessions can go here
end

# so that yazi exits to current directory
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# greeting
function fish_greeting
    if not command -q fastfech
        fastfetch
    end
end

# getting path
fish_add_path /opt/homebrew/bin

starship init fish | source
# Add Bun global bin to PATH
set -gx PATH /Users/michael/.bun/bin $PATH

string match -q "$TERM_PROGRAM" "kiro" and . (kiro --locate-shell-integration-path fish)
