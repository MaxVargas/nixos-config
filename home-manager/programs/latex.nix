{ config, pkgs, ...}:
let
  tex = (pkgs.texlive.combine {
    inherit (pkgs.texlive) scheme-full
      dvisvgm dvipng # for preview and export as html
      wrapfig amsmath ulem hyperref capt-of
      pgf tikz-cd cleveref cmbright latex-uni8
      xcolor wasysym enumitem;
      #(setq org-latex-compiler "lualatex"
      #(setq org-preview-latex default-process 'dvisvgm)
  });
in
{
  home.packages = with pkgs; [
    tex
  ];
}
