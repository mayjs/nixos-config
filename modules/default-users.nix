{ pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.may = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "storage" "scanner" "lp" "dialout" "video" "corectrl" ]; 
    shell = pkgs.bash;
  };
}
