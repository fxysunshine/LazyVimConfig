return {
  -- 首先安装 fzf 二进制工具
  {
    "junegunn/fzf",
    build = "./install --bin", -- 仅安装二进制文件，加快安装速度
    lazy = true,
  },

  -- 然后安装 fzf-lua 插件
  {
    "ibhagwan/fzf-lua",
    dependencies = {
      "junegunn/fzf",
      "nvim-tree/nvim-web-devicons", -- 可选，用于显示文件图标
    },
    event = "VeryLazy", -- 延迟加载，提高启动速度
    keys = {
      -- 配置常用快捷键
      { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Live grep" },
      { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Find buffers" },
      { "<leader>fh", "<cmd>FzfLua help_tags<cr>", desc = "Find help" },
      { "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Find old files" },
      { "<leader>fm", "<cmd>FzfLua marks<cr>", desc = "Find marks" },
      { "<leader>fc", "<cmd>FzfLua commands<cr>", desc = "Find commands" },
    },
    config = function()
      local fzf_lua = require("fzf-lua")

      -- 配置 fzf-lua
      fzf_lua.setup({
        -- 窗口样式配置
        winopts = {
          border = "rounded", -- 边框样式
          preview = {
            layout = "vertical", -- 预览窗口布局
            vertical = "down:50%", -- 垂直方向预览位置和大小
            scrollbar = false, -- 禁用滚动条
          },
        },

        -- 文件查找配置
        files = {
          prompt = "🔍 ", -- 提示符
          git_icons = true, -- 显示 git 状态图标
          file_icons = true, -- 显示文件类型图标
          -- 排除不需要搜索的目录
          find_opts = [[-type f -not -path '*/\.git/*' -not -path '*/node_modules/*' -not -path '*/dist/*']],
        },

        -- 内容搜索配置
        live_grep = {
          prompt = "📝 ",
          git_icons = true,
          file_icons = true,
          -- 使用 ripgrep 作为搜索工具（需提前安装）
          cmd = "rg --color=never --no-heading --hidden --glob '!.git/'",
        },

        -- 缓冲区查找配置
        buffers = {
          prompt = "📌 ",
          file_icons = true,
          sort_lastused = true, -- 按最近使用排序
        },

        -- 自定义快捷键
        keymap = {
          builtin = {
            ["<C-f>"] = "toggle-fullscreen", -- 全屏切换
            ["<C-u>"] = "preview-page-up", -- 预览页上翻
            ["<C-d>"] = "preview-page-down", -- 预览页下翻
            ["<Esc>"] = "close", -- 关闭窗口
          },
        },
      })
    end,
  },
}
