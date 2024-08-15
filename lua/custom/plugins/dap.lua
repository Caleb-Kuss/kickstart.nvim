local js_based_languages = {
  'typescript',
  'javascript',
  'typescriptreact',
  'javascriptreact',
  'vue',
}

return {
  { 'nvim-neotest/nvim-nio' },
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require 'dap'

      for _, language in ipairs(js_based_languages) do
        dap.configurations[language] = {
          -- Debug single nodejs files
          {
            type = 'pwa-node',
            request = 'launch',
            name = 'Launch file',
            program = '${file}',
            cwd = '${workspaceFolder}',
            sourceMaps = true,
          },
          -- Debug nodejs processes (make sure to add --inspect when you run the process)
          {
            type = 'pwa-node',
            request = 'attach',
            name = 'Attach',
            processId = require('dap.utils').pick_process,
            cwd = '${workspaceFolder}',
            sourceMaps = true,
          },
          -- Debug web applications (client side)
          {
            type = 'pwa-chrome',
            request = 'launch',
            name = 'Start Chrome with "localhost"',
            url = 'http://localhost:3000',
            webRoot = '${workspaceFolder}',
            userDataDir = '${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir',
          },
          -- Divider for the launch.json derived configs
          {
            name = '----- ↓ launch.json configs ↓ -----',
            type = '',
            request = 'launch',
          },
        }
      end
    end,
    keys = {
      {
        '<leader>Td',
        function()
          require('neotest').run.run { strategy = 'dap' }
        end,
        desc = 'Run Neotest with DAP strategy',
      },
      {
        '<leader>dB',
        function()
          require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
        end,
        desc = 'Set conditional breakpoint',
      },
      {
        '<leader>db',
        function()
          require('dap').toggle_breakpoint()
        end,
        desc = 'Toggle breakpoint',
      },
      {
        '<leader>dc',
        function()
          require('dap').continue()
        end,
        desc = 'Continue execution',
      },
      {
        '<leader>dC',
        function()
          require('dap').run_to_cursor()
        end,
        desc = 'Run to cursor',
      },
      {
        '<leader>dg',
        function()
          require('dap').goto_()
        end,
        desc = 'Go to line',
      },
      {
        '<leader>di',
        function()
          require('dap').step_into()
        end,
        desc = 'Step into',
      },
      {
        '<leader>dj',
        function()
          require('dap').down()
        end,
        desc = 'Move down the call stack',
      },
      {
        '<leader>dk',
        function()
          require('dap').up()
        end,
        desc = 'Move up the call stack',
      },
      {
        '<leader>dl',
        function()
          require('dap').run_last()
        end,
        desc = 'Re-run last debug session',
      },
      {
        '<leader>dO',
        function()
          require('dap').step_out()
        end,
        desc = 'Step out',
      },
      {
        '<leader>do',
        function()
          require('dap').step_over()
        end,
        desc = 'Step over',
      },
      {
        '<leader>dp',
        function()
          require('dap').pause()
        end,
        desc = 'Pause execution',
      },
      {
        '<leader>dr',
        function()
          require('dap').repl.toggle()
        end,
        desc = 'Toggle REPL',
      },
      {
        '<leader>ds',
        function()
          require('dap').session()
        end,
        desc = 'Show active session',
      },
      {
        '<leader>dt',
        function()
          require('dap').terminate()
        end,
        desc = 'Terminate session',
      },
      {
        '<leader>dh',
        function()
          require('dap.ui.widgets').hover()
        end,
        desc = 'Show hover information',
      },
      {
        '<leader>da',
        function()
          require('dap').continue()
        end,
        desc = 'Attach Debugger',
      },
    },
    dependencies = {
      -- Install the vscode-js-debug adapter
      {
        'microsoft/vscode-js-debug',
        -- After install, build it and rename the dist directory to out
        build = 'npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out',
        version = '1.*',
      },
      {
        'mxsdev/nvim-dap-vscode-js',
        config = function()
          ---@diagnostic disable-next-line: missing-fields
          require('dap-vscode-js').setup {
            -- Path of node executable. Defaults to $NODE_PATH, and then "node"
            -- node_path = "node",

            -- Path to vscode-js-debug installation.
            debugger_path = vim.fn.resolve(vim.fn.stdpath 'data' .. '/lazy/vscode-js-debug'),

            -- Command to use to launch the debug server. Takes precedence over "node_path" and "debugger_path"
            -- debugger_cmd = { "js-debug-adapter" },

            -- which adapters to register in nvim-dap
            adapters = {
              'chrome',
              'pwa-node',
              'pwa-chrome',
              'pwa-msedge',
              'pwa-extensionHost',
              'node-terminal',
            },

            -- Path for file logging
            -- log_file_path = "(stdpath cache)/dap_vscode_js.log",

            -- Logging level for output to file. Set to false to disable logging.
            -- log_file_level = false,

            -- Logging level for output to console. Set to false to disable console output.
            -- log_console_level = vim.log.levels.ERROR,
          }
        end,
      },
      {
        'rcarriga/nvim-dap-ui',
        event = 'VeryLazy',
        dependencies = 'mfussenegger/nvim-dap',
        config = function()
          local dap = require 'dap'
          local dapui = require 'dapui'
          require('dapui').setup()
          dap.listeners.after.event_initialized['dapui_config'] = function()
            dapui.open()
          end
          dap.listeners.before.event_terminated['dapui_config'] = function()
            dapui.close()
          end
          dap.listeners.before.event_exited['dapui_config'] = function()
            dapui.close()
          end
        end,
      },
      {
        'Joakker/lua-json5',
        build = './install.sh',
      },
    },
  },
  {
    table.insert(vim._so_trails, '/?.dylib'),

    require('dap.ext.vscode').load_launchjs(
      nil,
      { ['pwa-node'] = js_based_languages, ['node'] = js_based_languages, ['chrome'] = js_based_languages, ['pwa-chrome'] = js_based_languages }
    ),
  },
}
-- https://miguelcrespo.co/posts/debugging-javascript-applications-with-neovim/
