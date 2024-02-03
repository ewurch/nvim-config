return {
  "nvimdev/dashboard-nvim",
  opts = function(_, opts)
    local logo = [[
    ███████╗██╗    ██╗██╗   ██╗██████╗  ██████╗██╗  ██╗
    ██╔════╝██║    ██║██║   ██║██╔══██╗██╔════╝██║  ██║
    █████╗  ██║ █╗ ██║██║   ██║██████╔╝██║     ███████║
    ██╔══╝  ██║███╗██║██║   ██║██╔══██╗██║     ██╔══██║
    ███████╗╚███╔███╔╝╚██████╔╝██║  ██║╚██████╗██║  ██║
    ╚══════╝ ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝
    ]]
    local function get_hostname()
      local f = io.popen("/bin/hostname")
      if f == nil then
        return "ewurch"
      else
        local hostname = f:read("*a")
        f:close()
        return hostname
      end
    end
    logo = logo .. "@" .. get_hostname()
    logo = string.rep("\n", 8) .. logo .. "\n\n"
    opts.config.header = vim.split(logo, "\n")
  end,
}
