#!/bin/bash

# Fail on error
set -e

generate_i3_config() {
    # Define paths
    OUTPUT_FILE="./i3ranjer/etc/skel/i3ranjer/.config/i3/config"
    BASE_CONFIG="./base/config.i3"

    # Create parent directories if they don't exist
    mkdir -p "$(dirname "$OUTPUT_FILE")"

    # Write the autogenerated warning and base configuration to the output file
    {
        echo "# WARNING: This file is autogenerated. Do not modify directly."
        echo
        cat "$BASE_CONFIG"
    } > "$OUTPUT_FILE"

    # Compile i3 configs
    for CONFIG_FILE in ./modules/*/*.i3; do
        MODULE_NAME=$(basename "$(dirname "$CONFIG_FILE")")
        FILE_NAME=$(basename "$CONFIG_FILE")
        {
            echo
            echo "############################################################"
            echo "# ${MODULE_NAME}/$(basename "$FILE_NAME")"
            echo "############################################################"
            cat "$CONFIG_FILE"
            echo
        } >> "$OUTPUT_FILE"
    done
}

compile_deps() {
    # Declare an array to store dependencies
    deps=()

    # Loop through each dependencies.json file in modules
    for DEP_FILE in ./modules/*/dependencies.json; do
        if [ -f "$DEP_FILE" ]; then
            # Extract dependencies from the JSON and append them to the array
            dep_names=$(jq -r '[.[] | select(.manual != true) | .name] | join(" ")' "$DEP_FILE")
            for dep in $dep_names; do
                deps+=("$dep")
            done
        fi
    done

    # Remove duplicates and sort the array
    deps=($(printf "%s\n" "${deps[@]}" | sort -u))

    # Return the array
    echo "${deps[@]}"
}

# Generate a comma-separated list from the dependencies
deps_csv=$(compile_deps | tr ' ' ',')

# Replace placeholder with the generated dependencies
echo "Generating i3 configuration..." && generate_i3_config
echo "Compiling module dependencies..." && sed "s/\${module_packages}/$deps_csv/g" ./base/control > ./i3ranjer/DEBIAN/control
echo "Building i3ranjer package..." && dpkg-deb --build i3ranjer
echo "Linting package..." && lintian i3ranjer.deb
