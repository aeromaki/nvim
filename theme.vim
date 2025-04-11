set background=dark

highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="cterms"

set notermguicolors

hi Normal         ctermfg=White
hi Title          ctermfg=White cterm=bold
"hi NormalNC
hi Comment        ctermfg=7
hi Conceal        ctermfg=7
hi Whitespace     ctermfg=7
hi NonText        ctermfg=7

hi CursorLine     ctermbg=8
hi CursorColumn   ctermbg=8
hi ColorColumn    ctermbg=8 cterm=NONE

hi LineNr         ctermfg=8
hi LineNrAbove    ctermfg=8
hi LineNrBelow    ctermfg=8
hi CursorLineFold ctermfg=8
hi CursorLineSign ctermfg=8
hi EndOfBuffer    ctermfg=8
hi CursorLineNr   ctermfg=7 cterm=bold 

hi Cursor         cterm=reverse
hi TermCursor     cterm=reverse
hi TermCursorNC   ctermbg=8 ctermfg=Black cterm=NONE
hi lCursor        cterm=reverse
"CursorIM

hi CurSearch      ctermbg=Magenta ctermfg=White cterm=bold,italic
"hi IncSearch
hi Search         ctermbg=Blue ctermfg=White cterm=italic
"hi Substitute
hi Visual         ctermbg=Green ctermfg=Black
hi VisualNOS      ctermbg=White ctermfg=Black
hi MatchParen     ctermbg=White ctermfg=Black cterm=italic

hi NormalFloat    ctermbg=Black ctermfg=White
"FloatBorder
hi FloatTitle     ctermfg=White cterm=bold
hi Pmenu          ctermbg=Black ctermfg=White cterm=NONE
"hi PmenuKind
"hi PmenuExtra
"hi PmenuSbar
hi PmenuSel       ctermbg=Green ctermfg=Black cterm=NONE
"PmenuKindSel
"PmenuExtraSel
hi PmenuThumb     ctermfg=7

hi StatusLine     ctermbg=White ctermfg=Black cterm=NONE
hi StatusLineNC   ctermbg=8 ctermfg=Black cterm=NONE
hi TabLine        ctermbg=NONE ctermfg=White
hi TabLineSel     ctermbg=NONE ctermfg=Green
"hi TabLineFill
hi WinBar         ctermfg=White
hi WinBarNC       ctermfg=White

hi ModeMsg        ctermfg=Green
"hi MsgArea
"hi MsgSeparator
hi MoreMsg        ctermfg=Green
hi Question       ctermfg=Green
hi QuickFixLine   ctermfg=Green
hi WildMenu       ctermbg=Green ctermfg=Black

hi Winseparator   ctermfg=White
"hi VertSplit

hi Folded         ctermfg=8
hi FoldColumn     ctermfg=8
hi SignColumn     ctermfg=8

hi SpecialKey     ctermfg=White cterm=italic,underline
hi SpellBad       ctermfg=White cterm=italic,underline
hi SpellCap       ctermfg=White cterm=italic,underline
hi SpellLocal     ctermfg=White cterm=italic,underline
hi SpellRare      ctermfg=White cterm=italic,underline

hi Directory      ctermfg=Cyan

hi DiffAdd        ctermbg=Green ctermfg=black cterm=italic
hi DiffChange     ctermfg=Yellow cterm=italic
hi DiffDelete     ctermfg=Red cterm=italic
hi DiffText       ctermbg=Yellow ctermfg=Black cterm=italic

hi WarningMsg     ctermfg=Yellow cterm=bold
hi ErrorMsg       ctermfg=Red cterm=bold

hi RedrawDebugClear     ctermbg=Yellow ctermfg=black
hi RedrawDebugComposed  ctermbg=Green ctermfg=black
hi RedrawDebugRecompose ctermbg=Red ctermfg=Black
hi NvimInternalError    ctermbg=Red ctermfg=Red




hi Constant   ctermfg=Yellow
hi String     ctermfg=Yellow
"hi Character
"hi Number
"hi Boolean
"hi Float

hi Identifier ctermfg=Green
hi Function   ctermfg=Green

hi Statement  ctermfg=Red cterm=bold
"hi Conditional
"hi Repeat
"hi Label
hi Operator   ctermfg=Red
"hi Keyword
"hi Exception

hi Preproc    ctermfg=Red
"hi Include
"hi Define
"hi Macro
"hi Precondit

hi Type       ctermfg=Cyan
"hi StorageClass
"hi Structure
"hi Typedef

hi Special    ctermfg=Cyan
"hi SpecialChar
"hi Tag
"hi Delimiter
"hi SpecialComment
"hi Debug

hi Underlined ctermfg=White cterm=underline
hi Ignore     ctermfg=White
hi Error      ctermfg=Red cterm=bold
hi Todo       ctermfg=White cterm=bold




"hi LspReferenceText
"hi LspReferenceRead
"hi LspReferenceWrite
"hi LspCodeLens
"hi LspCodeLensSeparator
"hi LspSignatureActiveParameter

hi DiagnosticError          ctermfg=Red cterm=bold
hi DiagnosticWarn           ctermfg=Yellow cterm=bold
hi DiagnosticInfo           ctermfg=Cyan cterm=italic
hi DiagnosticHint           ctermfg=Cyan cterm=italic
hi DiagnosticOk             ctermfg=Green
"hi DiagnosticVirtualTextError
"hi DiagnosticVirtualTextWarn
"hi DiagnosticVirtualTextInfo
"hi DiagnosticVirtualTextHint
"hi DiagnosticVirtualTextOk
hi DiagnosticUnderlineError ctermfg=Red cterm=bold,italic,underline
hi DiagnosticUnderlineWarn  ctermfg=Yellow cterm=bold,italic,underline
hi DiagnosticUnderlineInfo  ctermfg=Cyan cterm=italic,underline
hi DiagnosticUnderlineHint  ctermfg=Cyan cterm=italic,underline
hi DiagnosticUnderlineOk    ctermfg=Green cterm=italic,underline
"hi DiagnosticFloatingError
"hi DiagnosticFloatingWarn
"hi DiagnosticFloatingInfo
"hi DiagnosticFloatingHint
"hi DiagnosticFloatingOk
"hi DiagnosticSignError
"hi DiagnosticSignWarn
"hi DiagnosticSignInfo
"hi DiagnosticSignHint
"hi DiagnosticSignOk
