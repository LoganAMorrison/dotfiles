local status_ok, Hydra = pcall(require, "hydra")
if not status_ok then
  return
end

Hydra {
  name = "Change / Resize Window",
  mode = { "n" },
  body = "<C-w>",
  config = {},
  timeout = false,
  heads = {
    -- move between windows
    { "h", "<C-w>h" },
    { "j", "<C-w>j" },
    { "k", "<C-w>k" },
    { "l", "<C-w>l" },
    -- resize windows
    { "H", "<C-w>3" },
    { "L", "<C-w>3" },
    { "J", "<C-w>2+" },
    { "K", "<C-w>2-" },
    -- equalize windows
    { "e", "<C-w>=" },
    -- close window
    { "Q", ":q<cr>" },
    { "<C-q>", ":q<cr>" },
    -- close window
    { "q", nil, { exit = true, nowait = true } },
    { ";", nil, { exit = true, nowait = true } },
    { "<Esc>", nil, { exit = true, nowait = true } },
  },
}
