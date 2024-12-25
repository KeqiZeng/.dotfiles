require("full-border"):setup {
	type = ui.Border.ROUNDED,
}

THEME.git = THEME.git or {}
THEME.git.modified = ui.Style():fg("#f9e2af")
THEME.git.added = ui.Style():fg("#a6e3a1")
THEME.git.untracked = ui.Style():fg("#b4befe")
THEME.git.ignored = ui.Style():fg("#9399b2")
THEME.git.deleted = ui.Style():fg("#f38ba8")
THEME.git.updated = ui.Style():fg("#89b4fa")

-- THEME.git.modified_sign = " "
-- THEME.git.added_sign = " "
-- THEME.git.untracked_sign = " "
-- THEME.git.ignored_sign = " "
-- THEME.git.deleted_sign = " "
-- THEME.git.updated_sign = "󰚰 "
THEME.git.modified_sign = "~"
THEME.git.added_sign = "+"
THEME.git.untracked_sign = "?"
THEME.git.ignored_sign = "i"
THEME.git.deleted_sign = "-"
THEME.git.updated_sign = "u"

require("git"):setup{}

require("yamb"):setup {
	cli = "fzf",
}
