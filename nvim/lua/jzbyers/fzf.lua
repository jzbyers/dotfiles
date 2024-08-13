vim.keymap.set("n", "<c-P>", require('fzf-lua').files, { desc = "Fzf Files" })
-- Or, with args
--vim.keymap.set("n", "<c-P>", function() require('fzf-lua').files({ ... }) end, { desc = "Fzf Files" })
