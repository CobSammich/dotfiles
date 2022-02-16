return {
    settings = {
        pylsp = {
            plugins = {
                -- Use pylint for linting, disable pyflakes and pycodestyle
                pylint = {
                    enabled = true,
                    executable = "/home/cob/.local/bin/pylint"
                },
                pycodestyle = {
                    enabled = false
                },
                pyflakes = {
                    enabled = false
                },
            }
        },
    },
}
