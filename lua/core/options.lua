local options = {
    autoindent = true,
	autoread = true,
	autowrite = true,
	backspace = "indent,eol,start",
	backup = false,
	backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim",
	breakat = [[\ \	;:,!?]],
	breakindentopt = "shift:2,min:20",
	clipboard = "unnamedplus",
	cmdheight = 1, -- 0, 1, 2
	cmdwinheight = 5,
	complete = ".,w,b,k",
	completeopt = "menuone,noselect",
	concealcursor = "niv",
	conceallevel = 0,
	cursorcolumn = true,
	cursorline = true,

	diffopt = "filler,iwhite,internal,linematch:60,algorithm:patience",
	display = "lastline",
	encoding = "utf-8",
	equalalways = false,
	errorbells = true,
	expandtab = true,
	fileformats = "unix,mac,dos",
	foldenable = true,
	foldlevelstart = 99,
	formatoptions = "1jcroql",
	grepformat = "%f:%l:%c:%m",
	grepprg = "rg --hidden --vimgrep --smart-case --",
	helpheight = 12,
	hidden = true,
	history = 2000,
	ignorecase = true,
	inccommand = "nosplit",

	incsearch = true,
	infercase = true,
	jumpoptions = "stack",
	laststatus = 2,
	linebreak = true,
	list = true,
	listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←",
	magic = true,
	mousescroll = "ver:3,hor:6",
	number = true,
	previewheight = 12,
		-- Do NOT adjust the following option (pumblend) if you're using transparent background
	pumblend = 0,
	pumheight = 15,
	redrawtime = 1500,
	relativenumber = true,
	ruler = true,

	scrolloff = 2,
	sessionoptions = "buffers,curdir,folds,help,tabpages,winpos,winsize",
	shada = "!,'500,<50,@100,s10,h",

	shiftround = true,
	shiftwidth = 4,
	shortmess = "aoOTIcF",
	showbreak = "↳  ",
	showcmd = false,
	showmode = false,
	showtabline = 2,
	sidescrolloff = 5,
	signcolumn = "yes",
	smartcase = true,
	smarttab = true,
	softtabstop = 4,

	splitbelow = true,
	splitkeep = "screen",
	splitright = true,
	startofline = false,
	swapfile = false,

	switchbuf = "usetab,uselast",
	synmaxcol = 2500,
	tabstop = 4,

	termguicolors = true,

	timeout = true,

	timeoutlen = 300,
	ttimeout = true,
	ttimeoutlen = 0,

	undofile = true,

	updatetime = 200,
	viewoptions = "folds,cursor,curdir,slash,unix",
	virtualedit = "block",
	visualbell = true,
	whichwrap = "h,l,<,>,[,],~",
	wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**",
	wildignorecase = true,
	
	winblend = 0,
	winminwidth = 10,
	winwidth = 30,
	wrap = false,
	wrapscan = true,
	writebackup = false,
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
