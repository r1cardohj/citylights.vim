" citylights.vim
" A Vim colorscheme based on the City Lights theme for VS Code
" Exact color extraction from the official theme JSON
" https://github.com/Yummygum/city-lights-syntax-vsc

" Setup
set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'citylights'

" ============================================================
" Color Palette (from City Lights theme JSON)
" ============================================================

" UI Colors
let s:bg         = '#1D252C'  " editor.background
let s:bg_alt     = '#181e24'  " editorGroupHeader.tabsBackground
let s:bg_line    = '#28313a'  " editor.lineHighlightBackground
let s:bg_sel     = '#28323a'  " editor.selectionBackground
let s:bg_widget  = '#15232d'  " editorHoverWidget.background
let s:bg_input   = '#333F4A'  " input.background
let s:bg_panel   = '#171d23'  " panel.background / sideBar.background
let s:bg_match   = '#b7c5d380' " editor.findMatchBackground (with alpha)
let s:bg_match_hl = '#b7c5d330' " editor.findMatchHighlightBackground

let s:fg         = '#B7C5D3'  " editor.foreground
let s:fg_dim     = '#718CA1'  " breadcrumb.foreground / meta colors
let s:fg_dark    = '#41505E'  " editorLineNumber.foreground / breadcrumb.activeSelectionForeground
let s:fg_comment = '#41505E'  " comment color
let s:fg_bright  = '#ffffff'  " terminal.ansiWhite

" Accent Colors (from tokenColors)
let s:cyan       = '#70e1e8'  " entity / support.function
let s:cyan_dark  = '#008b94'  " storage / HTML tags
let s:blue       = '#539afc'  " terminal.ansiBlue
let s:blue_light = '#68A1F0'  " string / punctuation.template-expression
let s:blue_bright = '#5ec4ff' " keyword / cursor
let s:purple     = '#b62d65'  " terminal.ansiMagenta / python self / super
let s:green      = '#8bd49c'  " terminal.ansiGreen / constants
let s:yellow     = '#ebbf83'  " terminal.ansiYellow / function parameters
let s:orange     = '#d98e48'  " variable.language / extending class
let s:red        = '#d95468'  " terminal.ansiRed / invalid
let s:pink       = '#e27e8d'  " constant / error
let s:teal       = '#33ced8'  " nested types / HTML entity
let s:sky        = '#9effff'  " PHP entity

" Terminal colors (from theme)
let s:term_black   = '#41505E'
let s:term_red     = '#d95468'
let s:term_green   = '#8bd49c'
let s:term_yellow  = '#ebbf83'
let s:term_blue    = '#539afc'
let s:term_magenta = '#b62d65'
let s:term_cyan    = '#70e1e8'
let s:term_white   = '#ffffff'

" Helper function
function! s:hi(group, fg, bg, ...)
  let l:fg = a:fg
  let l:bg = a:bg
  let l:attr = get(a:, 1, '')

  let l:cmd = 'hi ' . a:group
  if l:fg !=# ''
    let l:cmd .= ' guifg=' . l:fg
  endif
  if l:bg !=# ''
    let l:cmd .= ' guibg=' . l:bg
  endif
  if l:attr !=# ''
    let l:cmd .= ' gui=' . l:attr . ' cterm=' . l:attr
  endif

  execute l:cmd
endfunction

" ============================================================
" Editor UI
" ============================================================

call s:hi('Normal',       s:fg,         s:bg)
call s:hi('NormalNC',     s:fg,         s:bg)
call s:hi('Cursor',       s:bg,         s:blue_bright)
call s:hi('CursorLine',   '',           s:bg_line)
call s:hi('CursorColumn', '',           s:bg_line)
call s:hi('LineNr',       s:fg_dark,    s:bg)
call s:hi('CursorLineNr', s:blue_bright, s:bg_line, 'bold')
call s:hi('SignColumn',   '',           s:bg)
call s:hi('ColorColumn',  '',           s:bg_line)
call s:hi('VertSplit',    s:bg_alt,     s:bg_alt)
call s:hi('Folded',       s:fg_dim,     s:bg_alt)
call s:hi('FoldColumn',   s:fg_dim,     s:bg)
call s:hi('MatchParen',   s:blue_bright, '',       'bold')
call s:hi('Visual',       '',           s:bg_sel)
call s:hi('VisualNOS',    '',           s:bg_sel)
call s:hi('Search',       s:bg,         s:yellow, 'bold')
call s:hi('IncSearch',    s:bg,         s:orange, 'bold')
call s:hi('Substitute',   s:bg,         s:red,    'bold')
call s:hi('NonText',      s:fg_dark,    s:bg)
call s:hi('SpecialKey',   s:fg_dark,    s:bg)
call s:hi('Whitespace',   s:fg_dark,    s:bg)
call s:hi('EndOfBuffer',  s:fg_dark,    s:bg)

" Status & Tab lines
call s:hi('StatusLine',   s:fg,         s:bg_alt, 'bold')
call s:hi('StatusLineNC', s:fg_dim,     s:bg_alt)
call s:hi('TabLine',      s:fg_dim,     s:bg_alt)
call s:hi('TabLineFill',  '',           s:bg_alt)
call s:hi('TabLineSel',   s:blue_bright, s:bg,    'bold')
call s:hi('WildMenu',     s:bg,         s:blue_bright, 'bold')
call s:hi('Title',        s:blue,       '',       'bold')
call s:hi('ModeMsg',      s:blue_bright, '',       'bold')
call s:hi('MsgArea',      s:fg,         s:bg)
call s:hi('MoreMsg',      s:green,      '',       'bold')
call s:hi('Question',     s:green,      '',       'bold')
call s:hi('WarningMsg',   s:yellow,     '',       'bold')
call s:hi('ErrorMsg',     s:red,        '',       'bold')

" Pmenu (completion menu)
call s:hi('Pmenu',        s:fg,         s:bg_widget)
call s:hi('PmenuSel',     s:bg,         s:blue_bright, 'bold')
call s:hi('PmenuSbar',    '',           s:bg_alt)
call s:hi('PmenuThumb',   '',           s:fg_dark)

" Diff
call s:hi('DiffAdd',      s:green,      s:bg,     'reverse')
call s:hi('DiffChange',   s:blue,       s:bg,     'reverse')
call s:hi('DiffDelete',   s:red,        s:bg,     'reverse')
call s:hi('DiffText',     s:yellow,     s:bg,     'reverse')

" Spell
call s:hi('SpellBad',     s:red,        '',       'undercurl')
call s:hi('SpellCap',     s:blue,       '',       'undercurl')
call s:hi('SpellLocal',   s:cyan,       '',       'undercurl')
call s:hi('SpellRare',    s:purple,     '',       'undercurl')

" ============================================================
" Syntax Highlighting (mapped from City Lights tokenColors)
" ============================================================

" Comment -> #41505E
call s:hi('Comment',      s:fg_comment, '',       'italic')

" Constant -> #e27e8d (pink)
call s:hi('Constant',     s:pink,       '')
call s:hi('String',       s:blue_light, '')         " String -> #68A1F0
call s:hi('Character',    s:blue_light, '')
call s:hi('Number',       s:pink,       '')         " Constant -> #e27e8d
call s:hi('Boolean',      s:pink,       '')
call s:hi('Float',        s:pink,       '')

" Identifier -> #718CA1 (dim fg)
call s:hi('Identifier',   s:fg_dim,     '')
call s:hi('Function',     s:cyan,       '')         " support.function -> #70e1e8

" Statement -> #5ec4ff (blue_bright)
call s:hi('Statement',    s:blue_bright, '')       " keyword -> #5ec4ff
call s:hi('Conditional',  s:blue_bright, '')
call s:hi('Repeat',       s:blue_bright, '')
call s:hi('Label',        s:blue_bright, '')
call s:hi('Operator',     s:fg_dim,     '')         " meta.brace / punctuation -> #718CA1
call s:hi('Keyword',      s:blue_bright, '')        " keyword -> #5ec4ff
call s:hi('Exception',    s:blue_bright, '')

" PreProc -> #008b94 (cyan_dark)
call s:hi('PreProc',      s:cyan_dark,  '')          " storage -> #008B94
call s:hi('Include',      s:cyan_dark,  '')
call s:hi('Define',       s:cyan_dark,  '')
call s:hi('Macro',        s:cyan_dark,  '')
call s:hi('PreCondit',    s:cyan_dark,  '')

" Type -> #008b94 (cyan_dark) / #33ced8 (teal)
call s:hi('Type',         s:cyan_dark,  '')          " storage.type -> #008B94
call s:hi('StorageClass', s:cyan_dark,  '')
call s:hi('Structure',    s:cyan_dark,  '')
call s:hi('Typedef',      s:cyan_dark,  '')

" Special -> #70e1e8 (cyan)
call s:hi('Special',      s:cyan,       '')          " entity -> #70e1e8
call s:hi('SpecialChar',  s:pink,       '')
call s:hi('Tag',          s:cyan_dark,  '')          " HTML tags -> #008b94
call s:hi('Delimiter',    s:fg_dim,     '')           " punctuation -> #718CA1
call s:hi('SpecialComment', s:fg_comment, '',       'italic')
call s:hi('Debug',        s:red,        '')

call s:hi('Underlined',   s:blue,       '',       'underline')
call s:hi('Ignore',       s:fg_dark,    '')
call s:hi('Error',        s:red,        s:bg,     'bold')
call s:hi('Todo',         s:yellow,     s:bg,     'bold')

" ============================================================
" Treesitter (mapped from City Lights scopes)
" ============================================================

call s:hi('TSComment',           s:fg_comment, '',       'italic')
call s:hi('TSAnnotation',        s:cyan_dark,  '')
call s:hi('TSAttribute',         s:cyan_dark,  '')
call s:hi('TSConstructor',       s:cyan,       '')
call s:hi('TSError',             s:red,        '')
call s:hi('TSField',             s:fg_dim,     '')       " variable -> #718CA1
call s:hi('TSFunction',          s:cyan,       '')       " support.function -> #70e1e8
call s:hi('TSFuncBuiltin',       s:cyan,       '')
call s:hi('TSFuncMacro',         s:cyan,       '')
call s:hi('TSMethod',            s:cyan,       '')
call s:hi('TSKeyword',           s:blue_bright, '')     " keyword -> #5ec4ff
call s:hi('TSKeywordFunction',   s:cyan_dark,  '')      " storage.type.function -> #008B94
call s:hi('TSKeywordOperator',   s:blue_bright, '')
call s:hi('TSKeywordReturn',     s:blue_bright, '')
call s:hi('TSOperator',          s:fg_dim,     '')      " punctuation -> #718CA1
call s:hi('TSParameter',         s:yellow,     '')      " variable.parameter -> #ebbf83
call s:hi('TSParameterReference', s:yellow,    '')
call s:hi('TSProperty',          s:fg_dim,     '')      " variable -> #718CA1
call s:hi('TSPunctDelimiter',    s:fg_dim,     '')
call s:hi('TSPunctBracket',      s:fg_dim,     '')
call s:hi('TSPunctSpecial',      s:blue_bright, '')
call s:hi('TSString',            s:blue_light, '')      " string -> #68A1F0
call s:hi('TSStringRegex',       s:blue_light, '')
call s:hi('TSStringEscape',      s:blue_light, '')
call s:hi('TSStringSpecial',     s:blue_light, '')
call s:hi('TSSymbol',            s:pink,       '')
call s:hi('TSTag',               s:cyan_dark,  '')      " HTML tags -> #008b94
call s:hi('TSTagAttribute',      s:orange,     '')
call s:hi('TSTagDelimiter',      s:fg_dim,     '')
call s:hi('TSText',              s:fg,         '')
call s:hi('TSStrong',            s:fg,         '',       'bold')
call s:hi('TSEmphasis',          s:fg,         '',       'italic')
call s:hi('TSUnderline',         s:fg,         '',       'underline')
call s:hi('TSStrike',            s:fg_dim,     '',       'strikethrough')
call s:hi('TSTitle',             s:blue,       '',       'bold')
call s:hi('TSLiteral',           s:blue_light, '')
call s:hi('TSURI',               s:blue,       '',       'underline')
call s:hi('TSVariable',          s:fg_dim,     '')      " variable -> #718CA1
call s:hi('TSVariableBuiltin',   s:orange,     '')      " variable.language -> #d98e48
call s:hi('TSConstBuiltin',      s:green,      '')      " constant -> #8BD49C
call s:hi('TSConstMacro',        s:green,      '')
call s:hi('TSNumber',            s:pink,       '')      " constant -> #e27e8d
call s:hi('TSBoolean',           s:pink,       '')
call s:hi('TSFloat',             s:pink,       '')
call s:hi('TSCharacter',         s:blue_light, '')
call s:hi('TSCharacterSpecial',  s:blue_light, '')
call s:hi('TSNamespace',         s:cyan_dark,  '')
call s:hi('TSInclude',           s:cyan_dark,  '')
call s:hi('TSConditional',       s:blue_bright, '')
call s:hi('TSRepeat',            s:blue_bright, '')
call s:hi('TSLabel',             s:blue_bright, '')
call s:hi('TSException',         s:blue_bright, '')
call s:hi('TSType',              s:cyan_dark,  '')      " storage.type -> #008B94
call s:hi('TSTypeBuiltin',       s:teal,       '')      " support.type.primitive -> #33ced8
call s:hi('TSDefinition',        s:blue,       '',       'bold')
call s:hi('TSDefinitionUsage',   s:blue,       '')
call s:hi('TSCurrentScope',      s:blue,       '',       'bold')

" ============================================================
" LSP / Diagnostics
" ============================================================

call s:hi('DiagnosticError',            s:red,        '')
call s:hi('DiagnosticWarn',             s:yellow,     '')
call s:hi('DiagnosticInfo',             s:blue,       '')
call s:hi('DiagnosticHint',             s:cyan,       '')
call s:hi('DiagnosticVirtualTextError', s:red,        s:bg_alt)
call s:hi('DiagnosticVirtualTextWarn',  s:yellow,     s:bg_alt)
call s:hi('DiagnosticVirtualTextInfo',  s:blue,       s:bg_alt)
call s:hi('DiagnosticVirtualTextHint',  s:cyan,       s:bg_alt)
call s:hi('DiagnosticUnderlineError',   s:red,        '',       'undercurl')
call s:hi('DiagnosticUnderlineWarn',    s:yellow,     '',       'undercurl')
call s:hi('DiagnosticUnderlineInfo',    s:blue,       '',       'undercurl')
call s:hi('DiagnosticUnderlineHint',    s:cyan,       '',       'undercurl')
call s:hi('LspReferenceText',           '',           s:bg_sel)
call s:hi('LspReferenceRead',           '',           s:bg_sel)
call s:hi('LspReferenceWrite',          '',           s:bg_sel)
call s:hi('LspDiagnosticsDefaultError',       s:red,    '')
call s:hi('LspDiagnosticsDefaultWarning',     s:yellow, '')
call s:hi('LspDiagnosticsDefaultInformation',   s:blue,   '')
call s:hi('LspDiagnosticsDefaultHint',          s:cyan,   '')

" ============================================================
" Git Signs
" ============================================================

call s:hi('GitGutterAdd',    s:green,  '')
call s:hi('GitGutterChange', s:blue,   '')
call s:hi('GitGutterDelete', s:red,    '')
call s:hi('GitSignsAdd',     s:green,  '')
call s:hi('GitSignsChange',  s:blue,   '')
call s:hi('GitSignsDelete',  s:red,    '')
call s:hi('GitSignsAddLn',   '',       s:bg_alt)
call s:hi('GitSignsChangeLn','',       s:bg_alt)

" ============================================================
" NvimTree
" ============================================================

call s:hi('NvimTreeNormal',         s:fg,         s:bg)
call s:hi('NvimTreeFolderName',     s:cyan,       '')
call s:hi('NvimTreeFolderIcon',     s:cyan,       '')
call s:hi('NvimTreeOpenedFolderName', s:cyan,     '', 'bold')
call s:hi('NvimTreeRootFolder',     s:purple,     '', 'bold')
call s:hi('NvimTreeEmptyFolderName', s:fg_dim,    '')
call s:hi('NvimTreeExecFile',       s:green,      '', 'bold')
call s:hi('NvimTreeSpecialFile',    s:yellow,     '', 'bold')
call s:hi('NvimTreeIndentMarker',   s:fg_dark,    '')
call s:hi('NvimTreeGitDirty',       s:yellow,     '')
call s:hi('NvimTreeGitNew',         s:green,      '')
call s:hi('NvimTreeGitDeleted',     s:red,        '')
call s:hi('NvimTreeGitIgnored',     s:fg_dim,     '')
call s:hi('NvimTreeSymlink',        s:cyan,       '')
call s:hi('NvimTreeImageFile',      s:purple,     '')
call s:hi('NvimTreeMarkdownFile',   s:yellow,     '')
call s:hi('NvimTreeOpenedFile',     s:cyan,       '', 'bold')

" ============================================================
" Telescope
" ============================================================

call s:hi('TelescopeNormal',        s:fg,         s:bg)
call s:hi('TelescopeSelection',     s:blue_bright, s:bg_sel, 'bold')
call s:hi('TelescopeMatching',      s:yellow,     '',       'bold')
call s:hi('TelescopeBorder',        s:fg_dark,    '')
call s:hi('TelescopePromptBorder',  s:fg_dark,    '')
call s:hi('TelescopeResultsBorder', s:fg_dark,    '')
call s:hi('TelescopePreviewBorder', s:fg_dark,    '')
call s:hi('TelescopePromptPrefix',  s:blue_bright, '')
call s:hi('TelescopePromptCounter', s:fg_dim,     '')

" ============================================================
" WhichKey
" ============================================================

call s:hi('WhichKey',          s:blue_bright, '', 'bold')
call s:hi('WhichKeyGroup',     s:blue,        '')
call s:hi('WhichKeySeparator', s:fg_dim,      '')
call s:hi('WhichKeyDesc',      s:fg,          '')
call s:hi('WhichKeyValue',     s:green,       '')

" ============================================================
" Indent Blankline
" ============================================================

call s:hi('IndentBlanklineChar',        s:fg_dark,  '')
call s:hi('IndentBlanklineContextChar', s:blue_bright, '')

" ============================================================
" Illuminate
" ============================================================

call s:hi('IlluminatedWordText',  '', s:bg_sel)
call s:hi('IlluminatedWordRead',  '', s:bg_sel)
call s:hi('IlluminatedWordWrite', '', s:bg_sel)

" ============================================================
" Hop
" ============================================================

call s:hi('HopNextKey',   s:blue_bright, '', 'bold')
call s:hi('HopNextKey1',  s:blue,        '', 'bold')
call s:hi('HopNextKey2',  s:purple,      '')
call s:hi('HopUnmatched', s:fg_dim,      '')

" ============================================================
" Bufferline / Barbar
" ============================================================

call s:hi('BufferCurrent',       s:fg,          s:bg_alt, 'bold')
call s:hi('BufferCurrentIndex',  s:blue_bright, s:bg_alt)
call s:hi('BufferCurrentMod',    s:yellow,      s:bg_alt, 'bold')
call s:hi('BufferCurrentSign',   s:blue_bright, s:bg_alt)
call s:hi('BufferCurrentTarget', s:red,         s:bg_alt, 'bold')
call s:hi('BufferVisible',       s:fg_dim,      s:bg)
call s:hi('BufferVisibleIndex',  s:fg_dim,      s:bg)
call s:hi('BufferVisibleMod',    s:yellow,      s:bg)
call s:hi('BufferVisibleSign',   s:fg_dim,      s:bg)
call s:hi('BufferVisibleTarget', s:red,         s:bg,     'bold')
call s:hi('BufferInactive',      s:fg_dim,      s:bg)
call s:hi('BufferInactiveIndex', s:fg_dim,      s:bg)
call s:hi('BufferInactiveMod',   s:yellow,      s:bg)
call s:hi('BufferInactiveSign',  s:fg_dark,     s:bg)
call s:hi('BufferInactiveTarget',s:red,         s:bg,     'bold')
call s:hi('BufferTabpages',      s:blue_bright, s:bg,     'bold')
call s:hi('BufferTabpage',       s:fg_dark,     s:bg)

" ============================================================
" Notify
" ============================================================

call s:hi('NotifyERRORBorder', s:red,    '')
call s:hi('NotifyWARNBorder',  s:yellow, '')
call s:hi('NotifyINFOBorder',  s:blue,   '')
call s:hi('NotifyDEBUGBorder', s:fg_dim, '')
call s:hi('NotifyTRACEBorder', s:purple, '')
call s:hi('NotifyERRORIcon',   s:red,    '')
call s:hi('NotifyWARNIcon',    s:yellow, '')
call s:hi('NotifyINFOIcon',    s:blue,   '')
call s:hi('NotifyDEBUGIcon',   s:fg_dim, '')
call s:hi('NotifyTRACEIcon',   s:purple, '')
call s:hi('NotifyERRORTitle',  s:red,    '')
call s:hi('NotifyWARNTitle',   s:yellow, '')
call s:hi('NotifyINFOTitle',   s:blue,   '')
call s:hi('NotifyDEBUGTitle',  s:fg_dim, '')
call s:hi('NotifyTRACETitle',  s:purple, '')
call s:hi('NotifyERRORBody',   s:fg,     s:bg)
call s:hi('NotifyWARNBody',    s:fg,     s:bg)
call s:hi('NotifyINFOBody',    s:fg,     s:bg)
call s:hi('NotifyDEBUGBody',   s:fg,     s:bg)
call s:hi('NotifyTRACEBody',   s:fg,     s:bg)

" ============================================================
" Neo-tree
" ============================================================

call s:hi('NeoTreeNormal',         s:fg,     s:bg)
call s:hi('NeoTreeNormalNC',       s:fg,     s:bg)
call s:hi('NeoTreeRootName',       s:purple, '', 'bold')
call s:hi('NeoTreeGitAdded',       s:green,  '')
call s:hi('NeoTreeGitModified',    s:yellow, '')
call s:hi('NeoTreeGitDeleted',     s:red,    '')
call s:hi('NeoTreeGitConflict',    s:yellow, '', 'bold')
call s:hi('NeoTreeGitUntracked',   s:orange, '')
call s:hi('NeoTreeDirectoryName',  s:cyan,   '')
call s:hi('NeoTreeDirectoryIcon',  s:cyan,   '')
call s:hi('NeoTreeFileNameOpened', s:cyan,   '', 'bold')
call s:hi('NeoTreeFileName',       s:fg,     '')
call s:hi('NeoTreeIndentMarker',   s:fg_dark,'')
call s:hi('NeoTreeExpander',       s:fg_dim, '')
call s:hi('NeoTreeFloatBorder',    s:fg_dark,'')
call s:hi('NeoTreeFloatTitle',     s:blue,   '', 'bold')

" ============================================================
" Gitsigns (newer)
" ============================================================

call s:hi('GitSignsStagedAdd',    s:green,  '')
call s:hi('GitSignsStagedChange', s:blue,   '')
call s:hi('GitSignsStagedDelete', s:red,    '')

" ============================================================
" Terminal colors
" ============================================================

let g:terminal_color_0  = s:term_black
let g:terminal_color_1  = s:term_red
let g:terminal_color_2  = s:term_green
let g:terminal_color_3  = s:term_yellow
let g:terminal_color_4  = s:term_blue
let g:terminal_color_5  = s:term_magenta
let g:terminal_color_6  = s:term_cyan
let g:terminal_color_7  = s:term_white
let g:terminal_color_8  = s:term_black
let g:terminal_color_9  = s:term_red
let g:terminal_color_10 = s:term_green
let g:terminal_color_11 = s:term_yellow
let g:terminal_color_12 = s:term_blue
let g:terminal_color_13 = s:term_magenta
let g:terminal_color_14 = s:term_cyan
let g:terminal_color_15 = s:term_white

if has('nvim')
  let g:terminal_color_background = s:bg
  let g:terminal_color_foreground = s:fg
endif

" ============================================================
" Quickfix
" ============================================================

call s:hi('qfLineNr',    s:fg_dim,   '')
call s:hi('qfFileName',  s:blue,     '', 'bold')
call s:hi('qfSeparator', s:fg_dim,   '')
call s:hi('qfError',     s:red,      '')

" ============================================================
" netrw / Directory listing
" ============================================================

call s:hi('netrwDir',      s:cyan,   '', 'bold')
call s:hi('netrwClassify', s:fg_dim, '')
call s:hi('netrwExe',      s:green,  '', 'bold')
call s:hi('netrwSymLink',  s:cyan,   '')
call s:hi('netrwList',     s:fg_dim, '')

" ============================================================
" vimScript specific (from screenshot)
" ============================================================

call s:hi('vimCommand',    s:blue_bright, '')   " call, Plug -> keyword-ish
call s:hi('vimOption',     s:cyan_dark,   '')   " set options -> storage.type
call s:hi('vimString',     s:blue_light,  '')   " strings -> #68A1F0
call s:hi('vimNumber',     s:pink,        '')   " numbers -> #e27e8d
call s:hi('vimLineComment', s:fg_comment, '', 'italic')
call s:hi('vimComment',    s:fg_comment,  '', 'italic')
call s:hi('vimVar',        s:fg_dim,      '')   " variables -> #718CA1
call s:hi('vimFuncName',   s:cyan,        '')   " functions -> #70e1e8
call s:hi('vimFunc',       s:cyan,        '')
call s:hi('vimIsCommand',  s:blue_bright, '')
call s:hi('vimLet',        s:blue_bright, '')
call s:hi('vimMap',        s:blue_bright, '')
call s:hi('vimMapModKey',  s:orange,      '')
call s:hi('vimMapLhs',     s:green,       '')
call s:hi('vimMapRhs',     s:green,       '')
call s:hi('vimNotation',   s:orange,      '')
call s:hi('vimBracket',    s:fg_dim,      '')
call s:hi('vimParenSep',   s:fg_dim,      '')
call s:hi('vimSep',        s:fg_dim,      '')
call s:hi('vimOper',       s:fg_dim,      '')
call s:hi('vimOperParen',  s:fg,          '')
call s:hi('vimSynType',    s:cyan_dark,   '')
call s:hi('vimHighlight',  s:blue_bright, '')
call s:hi('vimGroup',      s:blue,        '')
call s:hi('vimGroupList',  s:blue,        '')
call s:hi('vimHiGroup',    s:blue,        '')
call s:hi('vimHiAttrib',   s:orange,      '')
call s:hi('vimHiClear',    s:blue_bright, '')
call s:hi('vimHiCtermColor', s:pink,      '')
call s:hi('vimHiGuiFgBg',  s:blue,        '')
call s:hi('vimHiGuiRgb',   s:green,       '')
call s:hi('vimHiNmbr',     s:pink,        '')
call s:hi('vimEscape',     s:orange,      '')
call s:hi('vimSet',        s:blue_bright, '')
call s:hi('vimSetEqual',   s:fg_dim,      '')
call s:hi('vimSetString',  s:blue_light,  '')
call s:hi('vimSetSep',     s:fg_dim,      '')
call s:hi('vimSetMod',     s:orange,      '')
call s:hi('vimAutoCmd',    s:blue_bright, '')
call s:hi('vimAutoEvent',  s:cyan_dark,   '')
call s:hi('vimAutoCmdSfxList', s:blue,    '')
call s:hi('vimSynKeyRegion', s:green,     '')
call s:hi('vimSynMatchRegion', s:green,   '')
call s:hi('vimSynRegion',  s:green,       '')
call s:hi('vimSynPatMod',  s:orange,      '')
call s:hi('vimSynNotPatRange', s:orange,  '')
call s:hi('vimSynRegPat',  s:green,       '')
call s:hi('vimSynRegOpt',  s:orange,      '')
call s:hi('vimSynMtchOpt', s:orange,      '')
call s:hi('vimSynContains', s:blue_bright, '')
call s:hi('vimSynNextgroup', s:blue_bright, '')
call s:hi('vimFold',       s:fg_comment,  '', 'italic')
call s:hi('vimScriptDelim', s:fg_comment, '', 'italic')
call s:hi('vimContinue',   s:fg_comment,   '')
call s:hi('vimCtrlChar',   s:orange,       '')
call s:hi('vimPlain',      s:fg,           '')
call s:hi('vimSpecFile',   s:green,        '')
call s:hi('vimPatSep',     s:orange,       '')
call s:hi('vimPatSepR',    s:orange,       '')
call s:hi('vimPatSepZ',    s:orange,       '')
call s:hi('vimPatSepZone', s:green,        '')
call s:hi('vimNotFunc',    s:blue_bright,  '')
call s:hi('vimFunction',   s:cyan,         '')
call s:hi('vimFunctionError', s:red,       '')
call s:hi('vimUserFunc',   s:cyan,         '')
call s:hi('vimUserAttrbKey', s:blue_bright, '')
call s:hi('vimUserAttrb',  s:blue,         '')
call s:hi('vimUserAttrbError', s:red,      '')
call s:hi('vimUserCommand', s:blue_bright,  '')
call s:hi('vimUserCmd',    s:blue_bright,  '')
call s:hi('vimEnvVar',     s:green,        '')
call s:hi('vimMark',       s:orange,       '')
call s:hi('vimRegister',   s:orange,       '')
call s:hi('vimAddress',    s:orange,       '')
call s:hi('vimFilter',     s:blue_bright,  '')
call s:hi('vimKeyword',    s:blue_bright,  '')
call s:hi('vimAugroupKey', s:blue_bright,  '')
call s:hi('vimAugroup',    s:blue,         '')
call s:hi('vimAugroupError', s:red,        '')
call s:hi('vimBehave',     s:blue_bright,  '')
call s:hi('vimBehaveModel', s:cyan_dark,   '')
call s:hi('vimFTCmd',      s:blue_bright,  '')
call s:hi('vimFTOption',   s:cyan_dark,    '')
call s:hi('vimFTError',    s:red,          '')
call s:hi('vimFiletype',   s:cyan_dark,    '')
call s:hi('vimAugroupSyncA', s:blue_bright, '')
call s:hi('vimExecute',    s:blue_bright,  '')
call s:hi('vimIf',         s:blue_bright,  '')
call s:hi('vimElse',       s:blue_bright,  '')
call s:hi('vimElseif',     s:blue_bright,  '')
call s:hi('vimEndif',      s:blue_bright,  '')
call s:hi('vimWhile',      s:blue_bright,  '')
call s:hi('vimFor',        s:blue_bright,  '')
call s:hi('vimEnd',        s:blue_bright,  '')
call s:hi('vimTry',        s:blue_bright,  '')
call s:hi('vimCatch',      s:blue_bright,  '')
call s:hi('vimFinally',    s:blue_bright,  '')
call s:hi('vimThrow',      s:blue_bright,  '')
call s:hi('vimTryException', s:blue_bright, '')
call s:hi('vimConst',      s:blue_bright,  '')
call s:hi('vimScope',      s:blue_bright,  '')
call s:hi('vimUnlet',      s:blue_bright,  '')
call s:hi('vimUnletVar',   s:blue,         '')
call s:hi('vimClusterName', s:blue,        '')
call s:hi('vimGroupName',  s:blue,         '')
call s:hi('vimGroupRem',   s:blue_bright,  '')
call s:hi('vimGroupAdd',   s:blue_bright,  '')
call s:hi('vimGroupSpecial', s:orange,     '')
call s:hi('vimSynCase',    s:blue_bright,  '')
call s:hi('vimSynCaseError', s:red,        '')
call s:hi('vimCluster',    s:blue,         '')
call s:hi('vimSynCluster', s:blue_bright,  '')
call s:hi('vimSynContainedin', s:blue_bright, '')
call s:hi('vimSynCont',    s:blue_bright,  '')
call s:hi('vimSynDefault', s:blue_bright,  '')
call s:hi('vimSynDef',     s:blue_bright,  '')
call s:hi('vimSynDollar',  s:orange,       '')
call s:hi('vimSynStar',    s:orange,       '')
call s:hi('vimSynPlus',    s:orange,       '')
call s:hi('vimSynOpt',     s:orange,       '')
call s:hi('vimSynFoldOpt', s:orange,       '')
call s:hi('vimSynSpell',   s:orange,       '')
call s:hi('vimSynCchar',   s:orange,       '')
call s:hi('vimSynCcharValue', s:green,     '')
call s:hi('vimSynSkip',    s:blue_bright,  '')
call s:hi('vimSynSkipWhite', s:green,      '')
call s:hi('vimSynRegionCluster', s:blue,   '')
call s:hi('vimSynRegOper', s:orange,       '')
call s:hi('vimSynRegOpt',  s:orange,       '')
call s:hi('vimSynMtchGrp', s:blue_bright,  '')
call s:hi('vimSynMatch',   s:blue_bright,  '')
call s:hi('vimSynMtchOpt', s:orange,       '')
call s:hi('vimSynMtchCchar', s:orange,     '')
call s:hi('vimSynMtchGroup', s:blue,       '')
call s:hi('vimSynKeyRegion', s:green,      '')
call s:hi('vimSynKeyOpt',  s:orange,       '')
call s:hi('vimSynKeyContainedin', s:blue_bright, '')
call s:hi('vimSynKeyNextgroup', s:blue_bright, '')
call s:hi('vimSynLine',    s:fg_comment,   '', 'italic')

" ============================================================
" sh shell script
" ============================================================

call s:hi('shEcho',        s:green,       '')
call s:hi('shEchoQuote',   s:green,       '')
call s:hi('shString',      s:blue_light,  '')
call s:hi('shNumber',      s:pink,        '')
call s:hi('shCommandSub',  s:cyan,        '')
call s:hi('shCmdSubRegion', s:cyan,       '')
call s:hi('shDeref',       s:cyan,        '')
call s:hi('shDerefSimple', s:cyan,        '')
call s:hi('shDerefVar',    s:cyan,        '')
call s:hi('shDerefSpecial', s:orange,     '')
call s:hi('shDerefOp',     s:fg_dim,      '')
call s:hi('shDerefPattern', s:green,       '')
call s:hi('shDerefDelim',  s:fg_dim,       '')
call s:hi('shDerefString', s:green,        '')
call s:hi('shVarAssign',   s:fg_dim,       '')
call s:hi('shVariable',    s:cyan,         '')
call s:hi('shSet',         s:blue_bright,  '')
call s:hi('shSetList',     s:cyan,         '')
call s:hi('shFunctionKey', s:blue_bright,  '')
call s:hi('shFunctionOne', s:cyan,         '')
call s:hi('shFunctionTwo', s:cyan,         '')
call s:hi('shFunctionThree', s:cyan,       '')
call s:hi('shFunctionFour', s:cyan,        '')
call s:hi('shFuncName',    s:cyan,         '', 'bold')
call s:hi('shStatement',   s:blue_bright,  '')
call s:hi('shLoop',        s:blue_bright,  '')
call s:hi('shConditional', s:blue_bright,  '')
call s:hi('shCaseEsac',    s:blue_bright,  '')
call s:hi('shCase',        s:blue_bright,  '')
call s:hi('shCaseEx',      s:blue_bright,  '')
call s:hi('shCaseBar',     s:fg_dim,       '')
call s:hi('shCaseStart',   s:blue_bright,  '')
call s:hi('shCaseLabel',   s:cyan_dark,    '')
call s:hi('shCaseIn',      s:blue_bright,  '')
call s:hi('shDo',          s:blue_bright,  '')
call s:hi('shDone',        s:blue_bright,  '')
call s:hi('shIf',          s:blue_bright,  '')
call s:hi('shThen',        s:blue_bright,  '')
call s:hi('shElif',        s:blue_bright,  '')
call s:hi('shElse',        s:blue_bright,  '')
call s:hi('shFi',          s:blue_bright,  '')
call s:hi('shFor',         s:blue_bright,  '')
call s:hi('shIn',          s:blue_bright,  '')
call s:hi('shWhile',       s:blue_bright,  '')
call s:hi('shUntil',       s:blue_bright,  '')
call s:hi('shTest',        s:blue_bright,  '')
call s:hi('shTestOpr',     s:fg_dim,       '')
call s:hi('shOperator',    s:fg_dim,       '')
call s:hi('shRedir',       s:fg_dim,       '')
call s:hi('shRedirStmt',   s:fg_dim,       '')
call s:hi('shSpecial',     s:orange,       '')
call s:hi('shSpecialChar', s:orange,       '')
call s:hi('shSpecialDbl',  s:orange,       '')
call s:hi('shSpecialNoZS', s:orange,       '')
call s:hi('shSpecialNxt',  s:orange,       '')
call s:hi('shSpecialVar',  s:orange,       '')
call s:hi('shQuote',       s:fg_dim,       '')
call s:hi('shSingleQuote', s:blue_light,   '')
call s:hi('shDoubleQuote', s:blue_light,   '')
call s:hi('shNoQuote',     s:fg,           '')
call s:hi('shExSingleQuote', s:blue_light, '')
call s:hi('shExDoubleQuote', s:blue_light, '')
call s:hi('shCmdParenRegion', s:cyan,      '')
call s:hi('shSubSh',       s:cyan,         '')
call s:hi('shCurlyIn',     s:fg,           '')
call s:hi('shArithRegion', s:cyan,         '')
call s:hi('shArith',       s:fg,           '')
call s:hi('shArithOper',   s:fg_dim,       '')
call s:hi('shArithOp',     s:fg_dim,       '')
call s:hi('shArithParen',  s:fg_dim,       '')
call s:hi('shParen',       s:fg_dim,       '')
call s:hi('shOption',      s:cyan_dark,    '')
call s:hi('shAlias',       s:cyan,         '')
call s:hi('shHereDoc',     s:blue_light,   '')
call s:hi('shHereString',  s:blue_light,   '')
call s:hi('shWrapLine',    s:fg_comment,   '', 'italic')
call s:hi('shShellVariables', s:cyan,       '')
call s:hi('shDblBrace',    s:fg_dim,       '')
call s:hi('shDblParen',    s:fg_dim,       '')
call s:hi('shCtrlSeq',     s:orange,       '')
call s:hi('shEscape',      s:orange,       '')
call s:hi('shColon',       s:fg_dim,       '')
call s:hi('shSemicolon',   s:fg_dim,       '')
call s:hi('shComment',     s:fg_comment,   '', 'italic')
call s:hi('shQuickComment', s:fg_comment,    '', 'italic')
call s:hi('shLine',        s:fg_comment,   '', 'italic')
call s:hi('shKeyword',     s:blue_bright,  '')
call s:hi('shException',   s:blue_bright,  '')
call s:hi('shTodo',        s:yellow,       s:bg, 'bold')
call s:hi('shHerePayload', s:blue_light,   '')
call s:hi('shPattern',     s:blue_light,   '')
call s:hi('shExpr',        s:fg,           '')
call s:hi('shTestPattern', s:blue_light,   '')
call s:hi('shBash',        s:blue_bright,  '')
call s:hi('shzsh',         s:blue_bright,  '')
call s:hi('shKsh',         s:blue_bright,  '')
call s:hi('shDash',        s:blue_bright,  '')
call s:hi('shCsh',         s:blue_bright,  '')
call s:hi('shTcl',         s:blue_bright,  '')

" ============================================================
" Terminal
" ============================================================

call s:hi('Terminal',      s:fg,         s:bg)
call s:hi('StatusLineTerm', s:fg,        s:bg_alt, 'bold')
call s:hi('StatusLineTermNC', s:fg_dim,  s:bg_alt)

" vim: set et ts=2 sw=2:
