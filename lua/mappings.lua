require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Nvim DAP
map("n", "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
map("n", "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
map("n", "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
map("n", "<Leader>dc>", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
map("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint" })
map(
	"n",
	"<Leader>dd",
	"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	{ desc = "Debugger set conditional breakpoint" }
)
map("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
map("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })

-- rustaceanvim
map("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })

-- Mason
map("n", "<Leader>q", "<cmd>lua vim.cmd('Mason')<CR>", { desc = "Open Mason" })

map('n', '<leader>ld', require('telescope.builtin').lsp_definitions, {})
map('n', '<leader>lr', require('telescope.builtin').lsp_references, {})

-- Quitter le terminal avec <Esc>
map('t', '<Esc>', '<C-\\><C-n>:q<CR>', { desc = "Quit terminal" })

-- Toggle terminal buffer
map('n', '<leader>tt', function()
    -- Cherche un buffer de terminal
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        local buf_name = vim.api.nvim_buf_get_name(buf)
        if buf_name:match("^term://") then
            -- Si trouvé, switch vers ce buffer
            vim.api.nvim_set_current_buf(buf)
            return
        end
    end
    -- Si aucun terminal n'est trouvé, on peut optionnellement en ouvrir un nouveau
    vim.cmd('terminal')
end, { desc = "Toggle terminal buffer" })

map("n", "<leader>ti", function()
  local api = require("nvim-tree.api")
  api.tree.toggle_gitignore_filter()
end, { desc = "Toggle .gitignore files" })
local M = {}

M.general = {
  n = {
    -- Voir la documentation de la fonction sous le curseur
    ["K"] = { function() vim.lsp.buf.hover() end, "Show documentation (hover)" },

    -- Aller à la définition de la fonction
    ["gd"] = { function() vim.lsp.buf.definition() end, "Go to definition" },
  },
}

return M

