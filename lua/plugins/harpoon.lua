return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function()
        local harpoon = require("harpoon")

        harpoon:setup()

        local map = vim.keymap.set

        -- Add current file
        map("n", "<leader>a", function()
            harpoon:list():add()
        end, { desc = "Harpoon Add File" })

        -- Toggle quick menu
        map("n", "<leader>e", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "Harpoon Menu" })

        -- Navigate files
        map("n", "<leader>1", function()
            harpoon:list():select(1)
        end, { desc = "Harpoon File 1" })

        map("n", "<leader>2", function()
            harpoon:list():select(2)
        end, { desc = "Harpoon File 2" })

        map("n", "<leader>3", function()
            harpoon:list():select(3)
        end, { desc = "Harpoon File 3" })

        map("n", "<leader>4", function()
            harpoon:list():select(4)
        end, { desc = "Harpoon File 4" })

        map("n", "<leader>5", function()
            harpoon:list():select(5)
        end, { desc = "Harpoon File 5" })

        map("n", "<leader>6", function()
            harpoon:list():select(6)
        end, { desc = "Harpoon File 6" })

        -- Previous / Next
        map("n", "<C-S-P>", function()
            harpoon:list():prev()
        end, { desc = "Harpoon Prev" })

        map("n", "<C-S-N>", function()
            harpoon:list():next()
        end, { desc = "Harpoon Next" })
    end,
}
