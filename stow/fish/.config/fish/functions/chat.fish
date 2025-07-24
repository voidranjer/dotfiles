function chat
    set tmp (mktemp)
    nvim $tmp

    # Check if the file is empty
    if test (stat -c %s $tmp) -eq 0
        rm $tmp
        return
    end

    cat $tmp | llm -m github_copilot/gpt-4.1 $argv
    llm logs -r | glow
    rm $tmp
end
