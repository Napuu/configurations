" python3 plugins
call remote#host#RegisterPlugin('python3', '/home/santeri/.vim/plugged/denite.nvim/rplugin/python3/denite', [
      \ {'sync': v:true, 'name': '_denite_init', 'type': 'function', 'opts': {}},
     \ ])
call remote#host#RegisterPlugin('python3', '/home/santeri/.vim/plugged/deoplete.nvim/rplugin/python3/deoplete', [
      \ {'sync': v:false, 'name': '_deoplete_init', 'type': 'function', 'opts': {}},
     \ ])


" ruby plugins


" python plugins


