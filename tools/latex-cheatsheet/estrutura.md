## Compilação em terminal
|Comando|Função|
|-|-|
|pdflatex {ficheiro.tex}|Compila o ficheiro .tex e converte para pdf.|
|bibtex {ficheiro}|Compila o determinado ficheiro de biblioteca, para o ficheiro .tex o reconhecer terá de usar `pdflatex {ficheiro.tex}` após.|

&nbsp;

---
## Comandos de estrutura
|Comando|Função/Uso|
|-|-|
|`documentclass[options]{class}`|Comando responsável por definir a estrutura do documento.<br>As 5 classes de codumento são:<br>· article<br>· report<br>· book<br>· slides<br>· letter<br>Dentro das opções está o tamanho da folha (a4paper, etc.), tamanho da letra (11pt, 12pt, ect.), número de colunas (onecolumn, twocolumn), etc.|
|`begin{document}`<br>...<br>`end{document}`|Usado para indicar o início e o fim do documento.|
|`begin{thebibliography}`<br>...<br>`end{thebibliography}`|Usado para indicar o início e o fim de uma bibliografia. Usado num ficheiro `.bib`.