{ ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;
    shellAliases = {
      ga = "git add";
      gap = "git add -p";
      gc = "git commit";
      gp = "git push";
      gP = "git pull";
      gd = "git diff";
      gl = "git log --oneline";
      gst = "git status";
    };
  };
}
