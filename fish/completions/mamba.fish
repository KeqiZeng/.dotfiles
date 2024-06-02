complete --command mamba --exclusive --short V --long version --description "Show the version of mamba and conda."
complete --command mamba --exclusive --short v --long verbose --description "Can be used multiple times. Once for detailed output, twice for INFO logging, thrice for DEBUG logging, four times for TRACE logging."
complete --command mamba --exclusive --short h --long help --description "Show help message."
complete --command mamba --exclusive --long no-plugins --description "Disable all plugins that are not built into conda."

complete --command mamba --exclusive --condition __fish_use_subcommand --arguments activate --description "Activate a conda environment."
complete --command mamba --exclusive --condition __fish_use_subcommand --arguments clean --description "Remove unused packages and caches."
complete --command mamba --exclusive --condition __fish_use_subcommand --arguments compare --description "Compare packages between conda environments."
# complete --command mamba --exclusive --condition __fish_use_subcommand --arguments config --description "Modify configuration values in .condarc."
complete --command mamba --exclusive --condition __fish_use_subcommand --arguments create --description "Create a new conda environment from a list of specified packages."
complete --command mamba --exclusive --condition __fish_use_subcommand --arguments deactivate --description "Deactivate a conda environment."
complete --command mamba --exclusive --condition __fish_use_subcommand --arguments env --description "Mamba options for environments."
complete --command mamba --exclusive --condition __fish_use_subcommand --arguments info --description "Display information about current conda install."
complete --command mamba --exclusive --condition __fish_use_subcommand --arguments init --description "Initialize mamba for shell interaction."
complete --command mamba --exclusive --condition __fish_use_subcommand --arguments install --description "Install a list of packages into a specified conda environment."
complete --command mamba --exclusive --condition __fish_use_subcommand --arguments list --description "List installed packages in a conda environment."
complete --command mamba --exclusive --condition __fish_use_subcommand --arguments remove --description "Remove a list of packages from a specified conda environment."
complete --command mamba --exclusive --condition __fish_use_subcommand --arguments uninstall --description "Alias for mamba remove."
complete --command mamba --exclusive --condition __fish_use_subcommand --arguments rename --description "Rename an existing environment."
complete --command mamba --exclusive --condition __fish_use_subcommand --arguments repoquery --description "Query repositories using mamba."
complete --command mamba --exclusive --condition __fish_use_subcommand --arguments run --description "Run an executable in a conda environment."
complete --command mamba --exclusive --condition __fish_use_subcommand --arguments search --description "Search for packages and display associated information using the MatchSpec format."
complete --command mamba --exclusive --condition __fish_use_subcommand --arguments update --description "Update conda packages to the latest compatible version."
complete --command mamba --exclusive --condition __fish_use_subcommand --arguments upgrade --description "Alias for mamba update."
complete --command mamba --exclusive --condition "__fish_seen_subcommand_from env" --arguments "create" --description "Create a new environment."
complete --command mamba --exclusive --condition "__fish_seen_subcommand_from env" --arguments "list" --description "List all conda environments."

function __mamba_envs
    mamba env list | grep -E '^\w' | awk '$1 != "base" {print $1}'
end

complete --command mamba --exclusive --condition "__fish_seen_subcommand_from activate" --arguments "(__mamba_envs)" --description "Mamba environments"
