function realign(s)
  local h, r = s:match "(%s*)(.*)"
  return r:gsub("\n" .. h, "\n")
end
