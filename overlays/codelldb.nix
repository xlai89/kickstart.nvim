#final: prev: {
#  # NOTE: override lldb package
#  vscode-extensions.vadimcn.vscode-lldb = final.lldb-nix-fix-pkgs.legacyPackages.${final.system}.vscode-extensions.vadimcn.vscode-lldb;
#}

inputs:
(final: prev:
let
  lldb-nix-fix-pkgs = import inputs.lldb-nix-fix { system = final.system; };
in
{
  # NOTE: override lldb package
  codelldb-from-lldb-nix-fix = lldb-nix-fix-pkgs.vscode-extensions.vadimcn.vscode-lldb;
})

#(final: prev: {
#  # NOTE: override lldb package
#  vscode-extensions = prev.vscode-extensions // {
#    vadimcn = prev.vscode-extensions.vadimcn // {
#      vscode-lldb = lldb-nix-fix.legacyPackages.${system}.vscode-extensions.vadimcn.vscode-lldb;
#    };
#  };
#})
