<h1>Dependencies</h1>

<ul>
<li>npm</li>
<li>git</li>
<li>nodejs</li>
<li>clangd</li>
<li>unzip</li>
<li>a nerd font (preferably Hack)</li>
<li>fzf</li>
<li>bat</li>
<li>perl</li>
<li>universal-ctags</li>
<li>latexmk</li>
<li>texlive-collection-latexrecommended</li> (Recommended)
</ul>

<h2>Run either to install:</h2>
<code>sudo apt install npm git clangd unzip fzf bat perl universal-ctags latexmk texlive-collection-latexrecommended</code>

<code>brew install npm git clangd unzip fzf bat perl universal-ctags latexm</code>

<h1>Fonts</h1>

<h2>Run to install:</h2>
<pre><code>wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip
unzip Hack.zip -d ~/.local/share/fonts
rm ~/.local/share/fonts/LICENSE.md ~/.local/share/fonts/README.md
fc-cache -fv
rm Hack.zip</code></pre>

