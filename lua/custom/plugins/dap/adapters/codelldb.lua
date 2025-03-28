-- Configurations for rust debugging with rustaceanvim
-- reference: <https://github.com/mfussenegger/nvim-dap/wiki/C-C---Rust-(via--codelldb)>
return {
  type = 'server',
  port = '${port}',
  executable = {
    -- CHANGE THIS to your path!
    -- If not using nixCats and the codelldb was installed by mason
    -- command = require('mason-registry').get_package('codelldb'):get_install_path() .. '/codelldb'
    -- If using nixCats and the codelldb was installed by nix
    -- TODO: may have to updated regularly ?
    command = '/nix/store/8nma6fpgpr8q9793hxylj8s9i8j6svqa-vscode-extension-vadimcn-vscode-lldb-1.10.0/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb',
    args = { '--port', '${port}' },

    -- On windows codelldb must be run attached or it crashes
    detached = vim.fn.has 'win32' == 0,
  },
}
