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
<li>ripgrep</li>
<li>the_silver_searcher</li>
<li>perl</li>
<li>universal-ctags</li>
<li>luarocks</li>
</ul>

<h2>Run to install:</h2>
<code>sudo apt install npm git nodejs unzip fzf bat ripgrep the_silver_searcher perl universal-ctags luarocks</code>
<code>brew install npm git nodejs unzip fzf bat ripgrep the_silver_searcher perl universal-ctags luarocks</code>

<h1>Fonts</h1>

<h2>Run to install:</h2>
<pre><code>wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip
unzip Hack.zip -d ~/.local/share/fonts
rm ~/.local/share/fonts/LICENSE.md ~/.local/share/fonts/README.md
fc-cache -fv</code></pre>

<h2>Or run this on one line</h2>
<code>sudo apt install npm git nodejs unzip fzf bat ripgrep the_silver_searcher perl universal-ctags luarocks && wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip && unzip Hack.zip -d ~/.local/share/fonts && rm ~/.local/share/fonts/LICENSE.md ~/.local/share/fonts/README.md && fc-cache -fv</code>

