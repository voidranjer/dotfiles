# ~/.config/fish/config.fish

# This is the main configuration file for the Fish shell.
#
# It should be kept as minimal as possible, primarily serving as
# the entry point for other more granular configuration files.
#
# Fish automatically loads:
# - All functions from ~/.config/fish/functions/ (each in its own .fish file)
# - All .fish files from ~/.config/fish/conf.d/ (in alphabetical order)

# -----------------------------------------------------------------------------
# 1. Environment Variables (if not suited for conf.d/)
#    Use 'set -x' for global exports, 'set -g' for global Fish variables.
# -----------------------------------------------------------------------------

# Example: Set a global environment variable (exported to sub-processes)
# set -x MY_ENV_VAR "some_value"

# Example: Set a global Fish variable (only within Fish shell)
# set -g fish_greeting "" # Disable the welcome message

# -----------------------------------------------------------------------------
# 2. Path Modifications (if not suited for conf.d/)
#    Often done in a conf.d file, but can be here for critical paths.
# -----------------------------------------------------------------------------

# Example: Add a directory to your PATH
# fish_add_path /usr/local/bin

# -----------------------------------------------------------------------------
# 3. Custom Prompt (if defined in a function)
#    Call your custom prompt function here.
# -----------------------------------------------------------------------------

# Example: Call a custom prompt function (e.g., if you have 'fish_prompt.fish' in functions/)
# fish_prompt

# -----------------------------------------------------------------------------
# 4. Sourcing Other Files (if not automatically loaded)
#    Only for files that Fish doesn't automatically load.
# -----------------------------------------------------------------------------

# Example: Source a custom file that contains unique settings not in functions/ or conf.d/
# source ~/.config/fish/my_custom_settings.fish

# -----------------------------------------------------------------------------
# End of config.fish
# -----------------------------------------------------------------------------
