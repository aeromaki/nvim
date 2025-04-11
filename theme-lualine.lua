local line = function (color_a)
  return {
    a = { bg = color_a, fg = 'Black', gui = 'bold' },
    b = { bg = 'Gray', fg = 'Black' },
    c = { bg = 'DarkGray', fg = 'Black' }
  }
end

return {
  normal = line('Green'),
  insert = line('Yellow'),
  visual = line('Green'),
  replace = line('Yellow'),
  command = line('Red'),
  inactive = line('Red')
}
