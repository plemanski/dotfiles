local status, peekaboo = pcall(require, 'vim-peekaboo')
if (not status) then return end

peekaboo.setup()
