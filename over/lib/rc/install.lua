function install(s, ...)
  for i,b in _G.ipairs {...} do
    rc[b]:merge {
      contents = s
    }
  end
end
