{ ... }:

{
  hardware.sane.enable = true;
  users.users.may.extraGroups = ["scanner" "lp"]; /* TODO: How can we apply this to all users? */
}
