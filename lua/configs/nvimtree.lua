return {
  git = {
     enable = true,
  },
  view = {
     side = "left",
     width = 35,
  },
  renderer = {
    icons = {
      webdev_colors = true,
      git_placement = "before",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        bookmark = "",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
    special_files = { "go.mod", "go.sum", "go.work", "Cargo.toml", "Makefile", "README.md", "readme.md" },
    symlink_destination = true,
  },
  actions = {
    open_file = {
        quit_on_open = true,
    },
  },
}

