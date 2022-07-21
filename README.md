# AstroNvim

My AstroNvim configuration

If you want to use AstroNvim, check out: [AstroNvim](https://github.com/kabinspace/AstroVim).
This repo is a fork of https://github.com/datamonsterr/astronvim_config, i made some minor changes.

# How to install my config

You can config `AstroNvim` in both `.config/nvim/lua/user` or `.config/astronvim/lua/user`.
But I recommend doing the second method for easily reinstallation.

Installation:

```bash
  git clone https://github.com/datamonsterr/astrovim_config ~/.config/astronvim/lua/user
  nvim  --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'  
```
