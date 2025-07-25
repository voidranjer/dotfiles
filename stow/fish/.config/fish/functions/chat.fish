function chat
    set tmp (mktemp)
    nvim $tmp +startinsert

    # Check if the file is empty
    if test (wc -c < $tmp | string trim) -eq 0
        rm $tmp
        return
    end

    cat $tmp | llm -m github_copilot/gpt-4.1 $argv
    clear
    llm logs -r | glow
    rm $tmp
end
