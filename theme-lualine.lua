local line = function (color_a)
  return {
    a = { bg = color_a, fg = 0, gui = 'bold' },
    b = { bg = 8, fg = 255 },
    c = { bg = 7, fg = 255 }
  }
end

return {
  normal = line(10),
  insert = line(11),
  visual = line(10),
  replace = line(11),
  command = line(9),
  inactive = line(9)
}
