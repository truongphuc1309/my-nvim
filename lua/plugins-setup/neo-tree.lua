require("neo-tree").setup({
    window = {
        width = 30,
    },
    default_component_configs = {
        icon = {
            folder_closed = " ",
            folder_open = " ",
            folder_empty = "  ",
        },
    },
    filesystem = {
        follow_current_file = {
            enable = true,
        },
        filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
        }
    }
})
