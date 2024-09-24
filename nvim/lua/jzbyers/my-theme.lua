---- autogenerated lush spec on Thu Sep 19 22:50:07 2024
-- Run :Lushify
-- then /Normal to find the Normal group and edit your fg & bg colors
local lush = require("lush")
local hsl = lush.hsl
local hsluv = lush.hsluv
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    SpecialKey                             { fg="nvimdarkgrey4", }, -- SpecialKey     xxx guifg=NvimDarkGrey4
    TermCursor                             { gui="reverse", }, -- TermCursor     xxx cterm=reverse gui=reverse
    NonText                                { fg="nvimdarkgrey4", }, -- NonText        xxx guifg=NvimDarkGrey4
    EndOfBuffer                            { NonText }, -- EndOfBuffer    xxx links to NonText
    Whitespace                             { NonText }, -- Whitespace     xxx links to NonText
    LspCodeLens                            { NonText }, -- LspCodeLens    xxx links to NonText
    LspInlayHint                           { NonText }, -- LspInlayHint   xxx links to NonText
    FzfLuaFzfInfo                          { NonText }, -- FzfLuaFzfInfo  xxx links to NonText
    Directory                              { fg="nvimlightcyan", }, -- Directory      xxx ctermfg=14 guifg=NvimLightCyan
    FzfLuaDirIcon                          { Directory }, -- FzfLuaDirIcon  xxx links to Directory
    ErrorMsg                               { fg="nvimlightred", }, -- ErrorMsg       xxx ctermfg=9 guifg=NvimLightRed
    NvimInvalidSpacing                     { ErrorMsg }, -- NvimInvalidSpacing xxx links to ErrorMsg
    Search                                 { bg="nvimdarkyellow", fg="nvimlightgrey1", }, -- Search         xxx ctermfg=0 ctermbg=11 guifg=NvimLightGrey1 guibg=NvimDarkYellow
    Substitute                             { Search }, -- Substitute     xxx links to Search
    CurSearch                              { bg="nvimlightyellow", fg="nvimdarkgrey1", }, -- CurSearch      xxx ctermfg=0 ctermbg=11 guifg=NvimDarkGrey1 guibg=NvimLightYellow
    IncSearch                              { CurSearch }, -- IncSearch      xxx links to CurSearch
    MoreMsg                                { fg="nvimlightcyan", }, -- MoreMsg        xxx ctermfg=14 guifg=NvimLightCyan
    CopilotAnnotation                      { MoreMsg }, -- CopilotAnnotation xxx links to MoreMsg
    ModeMsg                                { fg="nvimlightgreen", }, -- ModeMsg        xxx ctermfg=10 guifg=NvimLightGreen
    LineNr                                 { fg="nvimdarkgrey4", }, -- LineNr         xxx guifg=NvimDarkGrey4
    LineNrAbove                            { LineNr }, -- LineNrAbove    xxx links to LineNr
    LineNrBelow                            { LineNr }, -- LineNrBelow    xxx links to LineNr
    CursorLineNr                           { gui="bold", }, -- CursorLineNr   xxx cterm=bold gui=bold
    FzfLuaCursorLineNr                     { CursorLineNr }, -- FzfLuaCursorLineNr xxx links to CursorLineNr
    Question                               { fg="nvimlightcyan", }, -- Question       xxx ctermfg=14 guifg=NvimLightCyan
    StatusLine                             { bg="nvimlightgrey3", fg="nvimdarkgrey3", }, -- StatusLine     xxx cterm=reverse guifg=NvimDarkGrey3 guibg=NvimLightGrey3
    MsgSeparator                           { StatusLine }, -- MsgSeparator   xxx links to StatusLine
    StatusLineNC                           { bg="nvimdarkgrey3", fg="nvimlightgrey3", }, -- StatusLineNC   xxx cterm=bold guifg=NvimLightGrey3 guibg=NvimDarkGrey3
    TabLine                                { StatusLineNC }, -- TabLine        xxx links to StatusLineNC
    Title                                  { fg="nvimlightgrey2", gui="bold", }, -- Title          xxx cterm=bold gui=bold guifg=NvimLightGrey2
    FloatTitle                             { Title }, -- FloatTitle     xxx links to Title
    sym"@markup.heading"                   { Title }, -- @markup.heading xxx links to Title
    LspInfoTitle                           { Title }, -- LspInfoTitle   xxx links to Title
    Visual                                 { bg="#99cfff", fg="#000000", }, -- Visual         xxx guifg=#000000 guibg=#99cfff
    VisualNOS                              { Visual }, -- VisualNOS      xxx links to Visual
    LspReferenceText                       { Visual }, -- LspReferenceText xxx links to Visual
    LspSignatureActiveParameter            { Visual }, -- LspSignatureActiveParameter xxx links to Visual
    SnippetTabstop                         { Visual }, -- SnippetTabstop xxx links to Visual
    NvimSurroundHighlight                  { Visual }, -- NvimSurroundHighlight xxx links to Visual
    WarningMsg                             { fg="nvimlightyellow", }, -- WarningMsg     xxx ctermfg=11 guifg=NvimLightYellow
    Folded                                 { bg="nvimdarkgrey3", fg="nvimlightgrey4", }, -- Folded         xxx guifg=NvimLightGrey4 guibg=NvimDarkGrey3
    DiffAdd                                { bg="nvimdarkgreen", fg="nvimlightgrey1", }, -- DiffAdd        xxx ctermfg=0 ctermbg=10 guifg=NvimLightGrey1 guibg=NvimDarkGreen
    DiffChange                             { bg="nvimdarkgrey4", fg="nvimlightgrey1", }, -- DiffChange     xxx guifg=NvimLightGrey1 guibg=NvimDarkGrey4
    DiffDelete                             { fg="nvimlightred", gui="bold", }, -- DiffDelete     xxx cterm=bold ctermfg=9 gui=bold guifg=NvimLightRed
    DiffText                               { bg="nvimdarkcyan", fg="nvimlightgrey1", }, -- DiffText       xxx ctermfg=0 ctermbg=14 guifg=NvimLightGrey1 guibg=NvimDarkCyan
    SignColumn                             { fg="nvimdarkgrey4", }, -- SignColumn     xxx guifg=NvimDarkGrey4
    CursorLineSign                         { SignColumn }, -- CursorLineSign xxx links to SignColumn
    FoldColumn                             { SignColumn }, -- FoldColumn     xxx links to SignColumn
    Conceal                                { fg="nvimdarkgrey4", }, -- Conceal        xxx guifg=NvimDarkGrey4
    SpellBad                               { sp="nvimlightred", gui="undercurl", }, -- SpellBad       xxx cterm=undercurl gui=undercurl guisp=NvimLightRed
    SpellCap                               { sp="nvimlightyellow", gui="undercurl", }, -- SpellCap       xxx cterm=undercurl gui=undercurl guisp=NvimLightYellow
    SpellRare                              { sp="nvimlightcyan", gui="undercurl", }, -- SpellRare      xxx cterm=undercurl gui=undercurl guisp=NvimLightCyan
    SpellLocal                             { sp="nvimlightgreen", gui="undercurl", }, -- SpellLocal     xxx cterm=undercurl gui=undercurl guisp=NvimLightGreen
    Pmenu                                  { bg="nvimdarkgrey3", }, -- Pmenu          xxx cterm=reverse guibg=NvimDarkGrey3
    PmenuKind                              { Pmenu }, -- PmenuKind      xxx links to Pmenu
    PmenuExtra                             { Pmenu }, -- PmenuExtra     xxx links to Pmenu
    PmenuSbar                              { Pmenu }, -- PmenuSbar      xxx links to Pmenu
    PmenuSel                               { blend=0, bg="nvimlightgrey2", fg="nvimdarkgrey3", }, -- PmenuSel       xxx cterm=underline,reverse guifg=NvimDarkGrey3 guibg=NvimLightGrey2 blend=0
    WildMenu                               { PmenuSel }, -- WildMenu       xxx links to PmenuSel
    PmenuKindSel                           { PmenuSel }, -- PmenuKindSel   xxx links to PmenuSel
    PmenuExtraSel                          { PmenuSel }, -- PmenuExtraSel  xxx links to PmenuSel
    PmenuThumb                             { bg="nvimdarkgrey4", }, -- PmenuThumb     xxx guibg=NvimDarkGrey4
    FzfLuaScrollFloatFull                  { PmenuThumb }, -- FzfLuaScrollFloatFull xxx links to PmenuThumb
    TabLineSel                             { gui="bold", }, -- TabLineSel     xxx cterm=bold gui=bold
    CursorColumn                           { bg="nvimdarkgrey3", }, -- CursorColumn   xxx guibg=NvimDarkGrey3
    CursorLine                             { bg="nvimdarkgrey3", }, -- CursorLine     xxx guibg=NvimDarkGrey3
    FzfLuaCursorLine                       { CursorLine }, -- FzfLuaCursorLine xxx links to CursorLine
    ColorColumn                            { bg="nvimdarkgrey4", }, -- ColorColumn    xxx cterm=reverse guibg=NvimDarkGrey4
    QuickFixLine                           { fg="nvimlightcyan", }, -- QuickFixLine   xxx ctermfg=14 guifg=NvimLightCyan
    NormalFloat                            { bg="nvimdarkgrey1", }, -- NormalFloat    xxx guibg=NvimDarkGrey1
    FloatBorder                            { NormalFloat }, -- FloatBorder    xxx links to NormalFloat
    WinBar                                 { bg="nvimdarkgrey1", fg="nvimlightgrey4", gui="bold", }, -- WinBar         xxx cterm=bold gui=bold guifg=NvimLightGrey4 guibg=NvimDarkGrey1
    WinBarNC                               { bg="nvimdarkgrey1", fg="nvimlightgrey4", }, -- WinBarNC       xxx cterm=bold guifg=NvimLightGrey4 guibg=NvimDarkGrey1
    Cursor                                 { bg="fg", fg="bg", }, -- Cursor         xxx guifg=bg guibg=fg
    CursorIM                               { Cursor }, -- CursorIM       xxx links to Cursor
    FzfLuaCursor                           { Cursor }, -- FzfLuaCursor   xxx links to Cursor
    RedrawDebugNormal                      { gui="reverse", }, -- RedrawDebugNormal xxx cterm=reverse gui=reverse
    Underlined                             { gui="underline", }, -- Underlined     xxx cterm=underline gui=underline
    sym"@string.special.url"               { Underlined }, -- @string.special.url xxx links to Underlined
    sym"@markup.link"                      { Underlined }, -- @markup.link   xxx links to Underlined
    lCursor                                { bg="fg", fg="bg", }, -- lCursor        xxx guifg=bg guibg=fg
    Normal                                 { bg="#000000", fg="#99cfff", }, -- Normal         xxx guifg=#99cfff guibg=#000000
    WinSeparator                           { Normal }, -- WinSeparator   xxx links to Normal
    Ignore                                 { Normal }, -- Ignore         xxx links to Normal
    NvimSpacing                            { Normal }, -- NvimSpacing    xxx links to Normal
    FzfLuaNormal                           { Normal }, -- FzfLuaNormal   xxx links to Normal
    FzfLuaBorder                           { Normal }, -- FzfLuaBorder   xxx links to Normal
    Constant                               { fg="nvimlightgrey2", }, -- Constant       xxx guifg=NvimLightGrey2
    Character                              { Constant }, -- Character      xxx links to Constant
    Number                                 { Constant }, -- Number         xxx links to Constant
    Boolean                                { Constant }, -- Boolean        xxx links to Constant
    sym"@constant"                         { Constant }, -- @constant      xxx links to Constant
    Statement                              { fg="nvimlightgrey2", gui="bold", }, -- Statement      xxx cterm=bold gui=bold guifg=NvimLightGrey2
    Conditional                            { Statement }, -- Conditional    xxx links to Statement
    Repeat                                 { Statement }, -- Repeat         xxx links to Statement
    Label                                  { Statement }, -- Label          xxx links to Statement
    Keyword                                { Statement }, -- Keyword        xxx links to Statement
    Exception                              { Statement }, -- Exception      xxx links to Statement
    PreProc                                { fg="nvimlightgrey2", }, -- PreProc        xxx guifg=NvimLightGrey2
    Include                                { PreProc }, -- Include        xxx links to PreProc
    Define                                 { PreProc }, -- Define         xxx links to PreProc
    Macro                                  { PreProc }, -- Macro          xxx links to PreProc
    PreCondit                              { PreProc }, -- PreCondit      xxx links to PreProc
    Type                                   { fg="nvimlightgrey2", }, -- Type           xxx guifg=NvimLightGrey2
    StorageClass                           { Type }, -- StorageClass   xxx links to Type
    Structure                              { Type }, -- Structure      xxx links to Type
    Typedef                                { Type }, -- Typedef        xxx links to Type
    sym"@type"                             { Type }, -- @type          xxx links to Type
    NvimNumberPrefix                       { Type }, -- NvimNumberPrefix xxx links to Type
    NvimOptionSigil                        { Type }, -- NvimOptionSigil xxx links to Type
    LspInfoFiletype                        { Type }, -- LspInfoFiletype xxx links to Type
    Special                                { fg="nvimlightcyan", }, -- Special        xxx ctermfg=14 guifg=NvimLightCyan
    Tag                                    { Special }, -- Tag            xxx links to Special
    SpecialChar                            { Special }, -- SpecialChar    xxx links to Special
    SpecialComment                         { Special }, -- SpecialComment xxx links to Special
    Debug                                  { Special }, -- Debug          xxx links to Special
    sym"@variable.builtin"                 { Special }, -- @variable.builtin xxx links to Special
    sym"@variable.parameter.builtin"       { Special }, -- @variable.parameter.builtin xxx links to Special
    sym"@constant.builtin"                 { Special }, -- @constant.builtin xxx links to Special
    sym"@module.builtin"                   { Special }, -- @module.builtin xxx links to Special
    sym"@type.builtin"                     { Special }, -- @type.builtin  xxx links to Special
    sym"@attribute.builtin"                { Special }, -- @attribute.builtin xxx links to Special
    sym"@function.builtin"                 { Special }, -- @function.builtin xxx links to Special
    sym"@constructor"                      { Special }, -- @constructor   xxx links to Special
    sym"@punctuation.special"              { Special }, -- @punctuation.special xxx links to Special
    sym"@markup"                           { Special }, -- @markup        xxx links to Special
    sym"@tag.builtin"                      { Special }, -- @tag.builtin   xxx links to Special
    FzfLuaFzfMatch                         { Special }, -- FzfLuaFzfMatch xxx links to Special
    FzfLuaFzfPointer                       { Special }, -- FzfLuaFzfPointer xxx links to Special
    FzfLuaFzfPrompt                        { Special }, -- FzfLuaFzfPrompt xxx links to Special
    DiagnosticError                        { fg="nvimlightred", }, -- DiagnosticError xxx ctermfg=9 guifg=NvimLightRed
    DiagnosticFloatingError                { DiagnosticError }, -- DiagnosticFloatingError xxx links to DiagnosticError
    DiagnosticVirtualTextError             { DiagnosticError }, -- DiagnosticVirtualTextError xxx links to DiagnosticError
    DiagnosticSignError                    { DiagnosticError }, -- DiagnosticSignError xxx links to DiagnosticError
    sym"@comment.error"                    { DiagnosticError }, -- @comment.error xxx links to DiagnosticError
    DiagnosticWarn                         { fg="nvimlightyellow", }, -- DiagnosticWarn xxx ctermfg=11 guifg=NvimLightYellow
    DiagnosticFloatingWarn                 { DiagnosticWarn }, -- DiagnosticFloatingWarn xxx links to DiagnosticWarn
    DiagnosticVirtualTextWarn              { DiagnosticWarn }, -- DiagnosticVirtualTextWarn xxx links to DiagnosticWarn
    DiagnosticSignWarn                     { DiagnosticWarn }, -- DiagnosticSignWarn xxx links to DiagnosticWarn
    sym"@comment.warning"                  { DiagnosticWarn }, -- @comment.warning xxx links to DiagnosticWarn
    DiagnosticInfo                         { fg="nvimlightcyan", }, -- DiagnosticInfo xxx ctermfg=14 guifg=NvimLightCyan
    DiagnosticFloatingInfo                 { DiagnosticInfo }, -- DiagnosticFloatingInfo xxx links to DiagnosticInfo
    DiagnosticVirtualTextInfo              { DiagnosticInfo }, -- DiagnosticVirtualTextInfo xxx links to DiagnosticInfo
    DiagnosticSignInfo                     { DiagnosticInfo }, -- DiagnosticSignInfo xxx links to DiagnosticInfo
    sym"@comment.note"                     { DiagnosticInfo }, -- @comment.note  xxx links to DiagnosticInfo
    DiagnosticHint                         { fg="nvimlightblue", }, -- DiagnosticHint xxx ctermfg=12 guifg=NvimLightBlue
    DiagnosticFloatingHint                 { DiagnosticHint }, -- DiagnosticFloatingHint xxx links to DiagnosticHint
    DiagnosticVirtualTextHint              { DiagnosticHint }, -- DiagnosticVirtualTextHint xxx links to DiagnosticHint
    DiagnosticSignHint                     { DiagnosticHint }, -- DiagnosticSignHint xxx links to DiagnosticHint
    DiagnosticOk                           { fg="nvimlightgreen", }, -- DiagnosticOk   xxx ctermfg=10 guifg=NvimLightGreen
    DiagnosticFloatingOk                   { DiagnosticOk }, -- DiagnosticFloatingOk xxx links to DiagnosticOk
    DiagnosticVirtualTextOk                { DiagnosticOk }, -- DiagnosticVirtualTextOk xxx links to DiagnosticOk
    DiagnosticSignOk                       { DiagnosticOk }, -- DiagnosticSignOk xxx links to DiagnosticOk
    Comment                                { fg="#525252", }, -- Comment        xxx guifg=#525252
    DiagnosticUnnecessary                  { Comment }, -- DiagnosticUnnecessary xxx links to Comment
    sym"@comment"                          { Comment }, -- @comment       xxx links to Comment
    FzfLuaDirPart                          { Comment }, -- FzfLuaDirPart  xxx links to Comment
    LspInfoTip                             { Comment }, -- LspInfoTip     xxx links to Comment
    sym"@variable"                         { fg="nvimlightgrey2", }, -- @variable      xxx guifg=NvimLightGrey2
    sym"@lsp.type.variable"                { sym"@variable" }, -- @lsp.type.variable xxx links to @variable
    String                                 { fg="nvimlightgreen", }, -- String         xxx ctermfg=10 guifg=NvimLightGreen
    sym"@string"                           { String }, -- @string        xxx links to String
    NvimString                             { String }, -- NvimString     xxx links to String
    Identifier                             { fg="nvimlightblue", }, -- Identifier     xxx ctermfg=12 guifg=NvimLightBlue
    sym"@property"                         { Identifier }, -- @property      xxx links to Identifier
    NvimIdentifier                         { Identifier }, -- NvimIdentifier xxx links to Identifier
    Function                               { fg="nvimlightcyan", }, -- Function       xxx ctermfg=14 guifg=NvimLightCyan
    sym"@function"                         { Function }, -- @function      xxx links to Function
    LspInfoList                            { Function }, -- LspInfoList    xxx links to Function
    Operator                               { fg="nvimlightgrey2", }, -- Operator       xxx guifg=NvimLightGrey2
    sym"@operator"                         { Operator }, -- @operator      xxx links to Operator
    NvimAssignment                         { Operator }, -- NvimAssignment xxx links to Operator
    NvimOperator                           { Operator }, -- NvimOperator   xxx links to Operator
    Delimiter                              { fg="nvimlightgrey2", }, -- Delimiter      xxx guifg=NvimLightGrey2
    sym"@punctuation"                      { Delimiter }, -- @punctuation   xxx links to Delimiter
    NvimParenthesis                        { Delimiter }, -- NvimParenthesis xxx links to Delimiter
    NvimColon                              { Delimiter }, -- NvimColon      xxx links to Delimiter
    NvimComma                              { Delimiter }, -- NvimComma      xxx links to Delimiter
    NvimArrow                              { Delimiter }, -- NvimArrow      xxx links to Delimiter
    Todo                                   { fg="nvimlightgrey2", gui="bold", }, -- Todo           xxx cterm=bold gui=bold guifg=NvimLightGrey2
    sym"@comment.todo"                     { Todo }, -- @comment.todo  xxx links to Todo
    sym"@markup.strong"                    { gui="bold", }, -- @markup.strong xxx cterm=bold gui=bold
    sym"@markup.italic"                    { gui="italic", }, -- @markup.italic xxx cterm=italic gui=italic
    sym"@markup.strikethrough"             { gui="strikethrough", }, -- @markup.strikethrough xxx cterm=strikethrough gui=strikethrough
    sym"@markup.underline"                 { gui="underline", }, -- @markup.underline xxx cterm=underline gui=underline
    Added                                  { fg="nvimlightgreen", }, -- Added          xxx ctermfg=10 guifg=NvimLightGreen
    sym"@diff.plus"                        { Added }, -- @diff.plus     xxx links to Added
    Removed                                { fg="nvimlightred", }, -- Removed        xxx ctermfg=9 guifg=NvimLightRed
    sym"@diff.minus"                       { Removed }, -- @diff.minus    xxx links to Removed
    Changed                                { fg="nvimlightcyan", }, -- Changed        xxx ctermfg=14 guifg=NvimLightCyan
    sym"@diff.delta"                       { Changed }, -- @diff.delta    xxx links to Changed
    DiagnosticDeprecated                   { sp="nvimlightred", gui="strikethrough", }, -- DiagnosticDeprecated xxx cterm=strikethrough gui=strikethrough guisp=NvimLightRed
    sym"@lsp.mod.deprecated"               { DiagnosticDeprecated }, -- @lsp.mod.deprecated xxx links to DiagnosticDeprecated
    FloatShadow                            { blend=80, bg="nvimdarkgrey4", }, -- FloatShadow    xxx ctermbg=0 guibg=NvimDarkGrey4 blend=80
    FloatShadowThrough                     { blend=100, bg="nvimdarkgrey4", }, -- FloatShadowThrough xxx ctermbg=0 guibg=NvimDarkGrey4 blend=100
    MatchParen                             { bg="nvimdarkgrey4", gui="bold", }, -- MatchParen     xxx cterm=bold,underline gui=bold guibg=NvimDarkGrey4
    RedrawDebugClear                       { bg="nvimdarkyellow", }, -- RedrawDebugClear xxx ctermfg=0 ctermbg=11 guibg=NvimDarkYellow
    RedrawDebugComposed                    { bg="nvimdarkgreen", }, -- RedrawDebugComposed xxx ctermfg=0 ctermbg=10 guibg=NvimDarkGreen
    RedrawDebugRecompose                   { bg="nvimdarkred", }, -- RedrawDebugRecompose xxx ctermfg=0 ctermbg=9 guibg=NvimDarkRed
    Error                                  { bg="nvimdarkred", fg="nvimlightgrey1", }, -- Error          xxx ctermfg=0 ctermbg=9 guifg=NvimLightGrey1 guibg=NvimDarkRed
    NvimInvalid                            { Error }, -- NvimInvalid    xxx links to Error
    DiagnosticUnderlineError               { sp="nvimlightred", gui="underline", }, -- DiagnosticUnderlineError xxx cterm=underline gui=underline guisp=NvimLightRed
    DiagnosticUnderlineWarn                { sp="nvimlightyellow", gui="underline", }, -- DiagnosticUnderlineWarn xxx cterm=underline gui=underline guisp=NvimLightYellow
    DiagnosticUnderlineInfo                { sp="nvimlightcyan", gui="underline", }, -- DiagnosticUnderlineInfo xxx cterm=underline gui=underline guisp=NvimLightCyan
    DiagnosticUnderlineHint                { sp="nvimlightblue", gui="underline", }, -- DiagnosticUnderlineHint xxx cterm=underline gui=underline guisp=NvimLightBlue
    DiagnosticUnderlineOk                  { sp="nvimlightgreen", gui="underline", }, -- DiagnosticUnderlineOk xxx cterm=underline gui=underline guisp=NvimLightGreen
    NvimInternalError                      { bg="red", fg="red", }, -- NvimInternalError xxx ctermfg=9 ctermbg=9 guifg=Red guibg=Red
    NvimFigureBrace                        { NvimInternalError }, -- NvimFigureBrace xxx links to NvimInternalError
    NvimSingleQuotedUnknownEscape          { NvimInternalError }, -- NvimSingleQuotedUnknownEscape xxx links to NvimInternalError
    NvimInvalidSingleQuotedUnknownEscape   { NvimInternalError }, -- NvimInvalidSingleQuotedUnknownEscape xxx links to NvimInternalError
    CopilotSuggestion                      { fg="#808080", }, -- CopilotSuggestion xxx ctermfg=244 guifg=#808080
    CmpItemAbbrDeprecatedDefault           { fg="#525252", }, -- CmpItemAbbrDeprecatedDefault xxx guifg=#525252
    CmpItemAbbrDeprecated                  { CmpItemAbbrDeprecatedDefault }, -- CmpItemAbbrDeprecated xxx links to CmpItemAbbrDeprecatedDefault
    CmpItemKindDefault                     { fg="nvimlightcyan", }, -- CmpItemKindDefault xxx guifg=NvimLightCyan
    CmpItemKind                            { CmpItemKindDefault }, -- CmpItemKind    xxx links to CmpItemKindDefault
    lushify_99CFFF                         { bg="#99cfff", fg="#000000", }, -- lushify_99CFFF xxx guifg=#000000 guibg=#99cfff
    lushify_085191                         { bg="#085191", fg="#ffffff", }, -- lushify_085191 xxx guifg=#ffffff guibg=#085191
    lushify_031B30                         { bg="#031b30", fg="#ffffff", }, -- lushify_031B30 xxx guifg=#ffffff guibg=#031b30
    lushify_C4B345                         { bg="#c4b345", fg="#000000", }, -- lushify_C4B345 xxx guifg=#000000 guibg=#c4b345
    lushify_1C1B17                         { bg="#1c1b17", fg="#ffffff", }, -- lushify_1C1B17 xxx guifg=#ffffff guibg=#1c1b17
    lushify_000000                         { bg="#000000", fg="#ffffff", }, -- lushify_000000 xxx guifg=#ffffff guibg=#000000
  }
end)
return theme