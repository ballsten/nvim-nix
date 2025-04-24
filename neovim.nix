{
  symlinkJoin,
  makeWrapper,
  runCommandLocal,
  vimPlugins,
  pkgs,
  lib,
}: let
  packageName = "balls-pack";

  dependencies = with pkgs; [
    ripgrep
  ];

  startPlugins = with vimPlugins; [
    lz-n
  ];

  optPlugins = with vimPlugins; [
    catppuccin-nvim
    (nvim-treesitter.withPlugins (
      plugins: with plugins; [
        lua
        nix
      ]
    ))
  ];

  # function to resolve all dependencies
  # foldPlugins = builtins.foldl' (
  #   acc: next:
  #     acc
  #     ++ [
  #       next
  #     ]
  #     ++ (foldPlugins (next.dependencies or []))
  # ) [];

  # startPluginsWithDeps = lib.unique (foldPlugins startPlugins);
  # optPluginsWithDeps = lib.unique (foldPlugins optPlugins);

  packpath = runCommandLocal "packpath" {} ''
    mkdir -p $out/pack/${packageName}/{start,opt}
    ln -vsfT ${./BallsVim} $out/pack/${packageName}/start/BallsVim
    ${
      lib.concatMapStringsSep
      "\n"
      (plugin: "ln -vsfT ${plugin} $out/pack/${packageName}/start/${lib.getName plugin}")
      startPlugins
    }
    ${
      lib.concatMapStringsSep
      "\n"
      (plugin: "ln -vsfT ${plugin} $out/pack/${packageName}/opt/${lib.getName plugin}")
      optPlugins
    }
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
      --set PATH ${lib.makeBinPath dependencies} \
      --set-default NVIM_APPNAME ballsvim
  '';
  passthru = { inherit packpath; };
}
