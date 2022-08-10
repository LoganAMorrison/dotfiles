local Dashboard = {}

Dashboard.setup = function()
   vim.cmd "let g:dashboard_default_executive ='telescope'"
end

return Dashboard
