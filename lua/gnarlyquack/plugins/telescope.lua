return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        --{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
    },

    config = function()
        local ok, telescope = pcall(require, 'telescope')
        if not ok then
            vim.notify('Unable to load telescope')
            return
        end

        telescope.load_extension('fzf')

        local ok, builtin = pcall(require, 'telescope.builtin')
        if not ok then
            vim.notify('Unable to load telescope.builtin')
            return
        end

        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
        vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
    end,

}
