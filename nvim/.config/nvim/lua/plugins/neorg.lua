return {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    cmd = "Neorg",
    ft = "norg",
    enabled = false,

    opts = {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.norg.concealer"] = {
          config = {
            folds = false,
          }
        }, -- Adds pretty icons to your documents
        ["core.norg.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/Notes",
              -- Creative_Writing = "~/Notes/Creative_Writing",
            },
            default_workspace = "notes",
          },
        },
      },
    },
    dependencies = { { "nvim-lua/plenary.nvim" } },
  }
}
