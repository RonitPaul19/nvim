return {
	"nvim-lualine/lualine.nvim",

	event = "VeryLazy",

	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"ThePrimeagen/harpoon",
	},

	config = function()
		local colors = {
			sky = "#9ccfd8",
			base = "#191724",
			white = "#ffffff",
		}

		local function harpoon_component(index)
			return {
				function()
					local ok, harpoon = pcall(require, "harpoon")
					if not ok then
						return ""
					end

					local item = harpoon:list():get(index)
					if not item then
						return ""
					end

					return " " .. index .. " " .. vim.fn.fnamemodify(item.value, ":t") .. " "
				end,

				color = function()
					local ok, harpoon = pcall(require, "harpoon")
					if not ok then
						return { bg = "NONE", fg = colors.white }
					end

					local item = harpoon:list():get(index)
					if not item then
						return { bg = "NONE", fg = colors.white }
					end

					local full_path = vim.fn.fnamemodify(item.value, ":p")
					local current_file = vim.fn.expand("%:p")

					if full_path == current_file then
						return {
							bg = colors.sky,
							fg = colors.base,
							gui = "bold",
						}
					end

					return { bg = "NONE", fg = colors.white }
				end,

				cond = function()
					local ok, harpoon = pcall(require, "harpoon")
					if not ok then
						return false
					end

					return harpoon:list():get(index) ~= nil
				end,
			}
		end

		local harpoon_slots = {}

		for i = 1, 5 do
			table.insert(harpoon_slots, harpoon_component(i))
		end

		require("lualine").setup({
			options = {
				theme = "auto",
				component_separators = "",
				section_separators = "",
				globalstatus = true,
			},

			sections = {
				lualine_a = {},
				lualine_b = harpoon_slots,
				lualine_c = {},
				lualine_x = { "filename" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
