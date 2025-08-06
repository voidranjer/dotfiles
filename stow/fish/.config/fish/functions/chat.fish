function chat
    set model_name "github_copilot/claude-sonnet-4"
    set should_continue false

    # Check if -c flag is present in argv
    if contains -- -c $argv
        set should_continue true
    end

    while true
        set tmp (mktemp)
        nvim $tmp +startinsert

        # Check if the file is empty
        if test (wc -c < $tmp | string trim) -eq 0
            rm $tmp
            return
        end

        # Add -c flag to llm call if should_continue is true
        if test $should_continue = true
            cat $tmp | llm -m $model_name -c
        else
            cat $tmp | llm -m $model_name
        end

        set should_continue true
        clear
        llm logs -r | glow
        rm $tmp
    end
end
