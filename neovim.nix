{
  symlinkJoin,
  makeWrapper,
  runCommandLocal,
  vimPlugins,
  pkgs,
  lib,
}:
let
  packageName = "balls-pack";

  dependencies = with pkgs; [
  ];

  startPlugins = with vimPlugins; [
    lze
    lzextras
    nvim-lspconfig

    # treesitter grammars
    (nvim-treesitter.withPlugins (
      plugins: with plugins; [
        lua
        nix
        regex
        bash
        css
        markdown
        javascript
        typescript
        json
        html
      ]
    ))
  ];

  optPlugins = with vimPlugins; [
    nvim-treesitter-textobjects
    catppuccin-nvim
    which-key-nvim
    snacks-nvim
    lualine-nvim
    bufferline-nvim
    nvim-web-devicons
    gitsigns-nvim
    flash-nvim
    friendly-snippets
    blink-cmp
    grug-far-nvim
    trouble-nvim
    todo-comments-nvim
    nvim-ts-autotag
    noice-nvim
    nui-nvim
    mini-icons
    none-ls-nvim

    # coding
    conform-nvim
    lazydev-nvim
    mini-pairs
    mini-ai
    mini-surround
    nvim-lint
    ts-comments-nvim

    # util
    persistence-nvim
    plenary-nvim
  ];

  # function to resolve all dependencies
  foldPlugins = builtins.foldl' (
    acc: next:
    acc
    ++ [
      next
    ]
    ++ (foldPlugins (next.dependencies or [ ]))
  ) [ ];

  startPluginsWithDeps = lib.unique (foldPlugins startPlugins);
  optPluginsWithDeps = lib.unique (foldPlugins optPlugins);

  packpath = runCommandLocal "packpath" { } ''
    mkdir -p $out/pack/${packageName}/{start,opt}
    ln -vsfT ${./BallsVim} $out/pack/${packageName}/start/BallsVim
    ${lib.concatMapStringsSep "\n" (
      plugin: "ln -vsfT ${plugin} $out/pack/${packageName}/start/${lib.getName plugin}"
    ) startPluginsWithDeps}
    ${lib.concatMapStringsSep "\n" (
      plugin: "ln -vsfT ${plugin} $out/pack/${packageName}/opt/${lib.getName plugin}"
    ) optPluginsWithDeps}
  '';
in
symlinkJoin {
  name = "ballsvim";
  paths = [ pkgs.neovim-unwrapped ] ++ dependencies;
  nativeBuildInputs = [ makeWrapper ];
  postBuild = ''
    wrapProgram $out/bin/nvim \
      --add-flags '-u' \
      --add-flags 'NORC' \
      --add-flags '--cmd' \
      --add-flags "'set packpath^=${packpath} | set runtimepath^=${packpath}'" \
      --set-default NVIM_APPNAME ballsvim
  '';
  passthru = { inherit packpath; };
}
