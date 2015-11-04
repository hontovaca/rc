function file_slurp(s)
  return _G.assert(_G.io.open(s)):read("*a")
end
