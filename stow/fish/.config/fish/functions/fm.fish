# ranger-cd
function fm
    set tempfile /tmp/chosendir
    ranger --choosedir=$tempfile (pwd)

    if test -f $tempfile
        if [ (cat $tempfile) != (pwd) ]
            # cd (cat $tempfile)
            z (cat $tempfile) # assuming "zoxide" is installed
        end
    end

    rm -f $tempfile
end
