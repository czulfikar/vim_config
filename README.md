# vim_config
IMPORTANT: Latest commit is not tested with tmux. Decided to skip using tmux for now.

Steps to successfully update VIM environment:
=============================================
1. Git clone this repo.
2. Copy all files to $HOME folder. Overwrite existing files (if needed create backup first).
3. Install Vundle plugin: 
    # git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
4. Open Vim editor and perform plugin install for all vim plugins:
    Type ":" and command VundleInstall
5. Execute ctags to generate tags for existing source files:
    # cd <source_root_dir> && ctags -R .
5. Restart Vim.

Steps for Usage:
================
1. Open terminal window.
2. Start tmux:
    # tmux
3. Start Vim.
    # vim [filename]

Main Commands:
==============
NERDTree:
  - C-n -> Toggle NERDTree state

Tagbar:
  - <F7> -> Toggle Tagbar

a.vim:
  - :A  -> Switch back and forth between source and header
  - :AS -> Split horizontally and switch
  - :AV -> Split vertically and switch
  - :AT -> Open in new tab (to quit tab, use :q)
  - :IH -> Open/Switch to file under cursor
  - :IHS -> Split horizontally and switch
  - :IHV -> Split vertically and switch
  - :IHT -> Open in new tab (to quit tab, use :q)
  - :IHN -> Cycle through all matches
  
buffkill.vim:
  - :BUN -> Unload file, keep window/split
  - :BD  -> Delete file from buffer, keep window/split
  - :BW  -> Wipe file from buffer, keep window/split
  - :BB  -> Move backwards through open buffers
  - :BF  -> Move forwards through open buffers
  - :BA  -> Alternate
  
