# Aliases
alias ghcmd="gh copilot suggest"
alias ghask="gh copilot explain"
alias lg="lazygit"

# ranger-cd
function fm
    set tempfile /tmp/chosendir
    ranger --choosedir=$tempfile (pwd)

    if test -f $tempfile
        if [ (cat $tempfile) != (pwd) ]
            cd (cat $tempfile)
        end
    end

    rm -f $tempfile
end
