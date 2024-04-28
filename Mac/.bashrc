
            __main() {
                local major="${BASH_VERSINFO[0]}"
                local minor="${BASH_VERSINFO[1]}"

                if ((major > 4)) || { ((major == 4)) && ((minor >= 1)); }; then
                    source <(/opt/homebrew/bin/starship init bash --print-full-init)
                else
                    source /dev/stdin <<<"$(/opt/homebrew/bin/starship init bash --print-full-init)"
                fi
            }
            __main
            unset -f __main
            