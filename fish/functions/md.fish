function md -d "Render markdown to HTML and open in browser"
    argparse 'h/help' 'd/dark' 'w/watch' -- $argv
    or return

    if set -q _flag_help; or test (count $argv) -eq 0
        echo "Usage: md [OPTIONS] FILE"
        echo "  -d, --dark   Use dark theme"
        echo "  -w, --watch  Rebuild on file changes"
        echo "  -h, --help   Show this help"
        return 0
    end

    set -l css ~/.config/pandoc/markdown.css
    if set -q _flag_dark
        set css ~/.config/pandoc/markdown-dark.css
    end

    set -l outfile /tmp/$argv[1].html

    if set -q _flag_watch
        pandoc $argv[1] --embed-resources --standalone --css $css -o $outfile
        open $outfile
        fswatch -o $argv[1] | while read -l event
            pandoc $argv[1] --embed-resources --standalone --css $css -o $outfile
        end
    else
        pandoc $argv[1] --embed-resources --standalone --css $css -o $outfile
        open $outfile
    end
end
