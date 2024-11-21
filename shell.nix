with (import <nixpkgs> {});
mkShell {
  buildInputs = [
    clang
    pcre
    cbqn
  ];
}
