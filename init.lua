
return {
  colorscheme = "one_monokai",
  
  polish = function ()
    -- code
    vim.filetype.add({
      extension = {
        comp = 'glsl',
        frag = 'glsl',
        vert = 'glsl',
        geom = 'glsl',
      }
    })
  end
}
