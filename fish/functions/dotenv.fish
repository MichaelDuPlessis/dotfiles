function dotenv
    for line in (cat .env)
        set --local key_value (string split -m 1 "=" $line)
        if test (count $key_value) -eq 2
            set -gx $key_value[1] $key_value[2]
        end
    end
end
