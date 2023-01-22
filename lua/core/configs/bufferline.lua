local close_func = function(bufnum)
  local bufdelete_avail, bufdelete = pcall(require, 'bufdelete')
  if bufdelete_avail then
    bufdelete.bufdelete(bufnum, true)
  else
    vim.cmd.bdelete { args = { bufnum }, bang = true }
  end
end

require('bufferline').setup {
  options = {
    offsets = { { filetype = 'NvimTree', text = '', padding = 1 } },
    show_buffer_icons = false,
    show_buffer_close_icons = false,
    close_command = close_func
  }
}

vim.keymap.set('n', '<leader>q', function() close_func(0) end)
