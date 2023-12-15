{ ... }:

{
  programs.adb.enable = true;
  users.users.may.extraGroups = ["adbusers"];
}
