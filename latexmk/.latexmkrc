# .latexmkrc starts
$pdf_mode = 1;
$pdf_previewer = "open -a Skim";
# $pdf_previewer = "zathura";
$pdflatex = "pdflatex -file-line-error -halt-on-error -interaction=nonstopmode -synctex=1 %O %S";
$xelatex = "xelatex -file-line-error -halt-on-error -interaction=nonstopmode -synctex=1 %O %S";
$bibtex_use = 1.5;
@generated_exts = (@generated_exts, 'synctex.gz');
# $out_dir = "latex.out";
$cleanup_mode = 1;
$clean_ext = "hd nav snm xdv bbl out log fls fdb_latexmk";
$preview_continuous_mode = 1;
@default_files = ('main.tex');
# .latexmkrc ends
