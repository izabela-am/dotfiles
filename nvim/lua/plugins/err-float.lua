--return {
--  vim.keymap.set("n", "<leader>er", function()
--    local devicons = require("nvim-web-devicons")
--
--    local filename = vim.fn.expand("%:t")
--    local extension = vim.fn.expand("%:e")
--
--    local icon, _ = devicons.get_icon(filename, extension, { default = true })
--
-- vim.diagnostic.open_float(nil, {
--    border = "rounded",
--     focusable = false,
--      scope = "line",
--      header = icon .. " " .. filename,
--      source = "always",
--      prefix = "",
--    })
--  end, { desc = "Show line diagnostics" }),
--}

return {

	vim.keymap.set("n", "<leader>er", function()
		local devicons = require("nvim-web-devicons")
		local bufnr = vim.api.nvim_create_buf(false, true)

		local filename = vim.fn.expand("%:t")
		local extension = vim.fn.expand("%:e")
		local icon, icon_hl = devicons.get_icon(filename, extension, { default = true })

		local diagnostics = vim.diagnostic.get(0, { lnum = vim.api.nvim_win_get_cursor(0)[1] - 1 })
		if vim.tbl_isempty(diagnostics) then
			return
		end

		local lines = { icon .. "  " .. filename }
		local highlights = {
			{ 0, 0, #icon, icon_hl },
		}

		for i, d in ipairs(diagnostics) do
			local prefix = string.format("[%s] ", d.source or "LSP")
			local msg = prefix .. d.message:gsub("\n", " ")
			local line_num = #lines
			table.insert(lines, msg)

			local hl_group = ({
				[vim.diagnostic.severity.ERROR] = "DiagnosticError",
				[vim.diagnostic.severity.WARN] = "DiagnosticWarn",
				[vim.diagnostic.severity.INFO] = "DiagnosticInfo",
				[vim.diagnostic.severity.HINT] = "DiagnosticHint",
			})[d.severity] or "Normal"

			table.insert(highlights, { line_num, 0, -1, hl_group })
		end

		vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)

		for _, hl in ipairs(highlights) do
			local line, col_start, col_end, group = unpack(hl)
			vim.api.nvim_buf_add_highlight(bufnr, -1, group, line, col_start, col_end)
		end

		local max_line_width = 0
		for _, line in ipairs(lines) do
			max_line_width = math.max(max_line_width, vim.fn.strdisplaywidth(line))
		end

		local float_opts = {
			relative = "cursor",
			style = "minimal",
			width = math.min(math.max(max_line_width + 4, 40), 80),
			height = #lines,
			row = 1,
			col = 1,
			border = "rounded",
		}

		local win = vim.api.nvim_open_win(bufnr, false, float_opts)

		-- Auto-close the window on cursor movement, insert mode, or buffer hide
		local augroup = vim.api.nvim_create_augroup("CloseDiagnosticFloat", { clear = false })

		vim.api.nvim_create_autocmd({ "CursorMoved", "InsertEnter", "BufLeave" }, {
			group = augroup,
			once = true,
			callback = function()
				if vim.api.nvim_win_is_valid(win) then
					vim.api.nvim_win_close(win, true)
				end
			end,
		})
	end, { desc = "Popup diagnostics with auto-close and icon" }),
}
