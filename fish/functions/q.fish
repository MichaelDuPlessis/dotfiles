function qchat --description "Amazon Q CLI with lazy initialization"
    # Check if Q is already initialized
    if not set -q __q_initialized
        # Initialize Q only when first used
        if test -x ~/.local/bin/q
            eval (~/.local/bin/q init fish pre --rcfile 00_fig_pre | string split0)
            eval (~/.local/bin/q init fish post --rcfile 99_fig_post | string split0)
            set -g __q_initialized 1
        end
    end

    # Execute the actual Q command
    echo got here
    command ~/.local/bin/q $argv
end
