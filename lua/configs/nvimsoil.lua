return {
  ft = "plantuml",
  actions = {
    redraw = true
  },
  image = {
    darkmode = false,
    format = "png",
    execute_to_open = function(img)
      return "feh -R 5 -F -Z " .. img
    end
  }
}
