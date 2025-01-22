return
{
  dir="~/projects/timerly",
  --dir ="~/projects/timerly",
  cmd = "TimerlyToggle",
  dependencies = "nvzone/volt",

  opts = {
    minutes = { 0.3, 0.1},
    cycle = true,
    delay = 2,
    on_finish = function()
      vim.notify "Time's up"
    end,
  },
}
