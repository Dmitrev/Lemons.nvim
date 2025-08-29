local M = {}

-- only enabled when editing theme, NOT when using it
--- MAKE SURE TO DISABLE THIS AFTERWARDS ---
local editing = false

-- stylua: ignore
M.colors = {
    black        = "#040404",
    darker_grey  = "#151515",
    dark_grey    = "#202020",
    grey         = "#3b3b3b",
    light_grey   = "#565656",
    darker_white = "#808080",
    dark_white   = "#cacaca",
    white        = "#F5F5F5",
    dark_red     = "#1B0C0F",
    red          = "#DE3354",
    light_red    = "#FF446F",
    dark_green   = "#0B1B10",
    lime         = "#2ed592",
    green        = "#2ED563",
    light_green  = "#44F656",
    dark_yellow  = "#1D190D",
    orange       = "#fa8a49",
    yellow       = "#F0BE42",
    light_yellow = "#F5E44E",
    dark_blue    = "#0D1018",
    blue         = "#4063BB",
    light_blue   = "#5E76FC",
    dark_purple  = "#1B0F17",
    purple       = "#D758B0",
    light_purple = "#FF73E4",
    dark_cyan    = "#0C1918",
    cyan         = "#37C3B5",
    light_cyan   = "#6AD8ED",
}

local c = M.colors

---@type table<string, vim.api.keyset.highlight>
local highlights = {
    Normal = { fg = c.white, bg = c.black },
    ColorColumn = { bg = c.darker_grey },
    Conceal = { fg = c.darker_white },
    CurSearch = { bg = c.yellow, fg = c.black },
    Cursor = { bg = c.white, fg = c.black },
    CursorColumn = { bg = c.darker_grey },
    CursorLine = { bg = c.darker_grey },
    Directory = { fg = c.orange },
    DiffAdd = { bg = c.dark_green },
    DiffChange = { bg = c.dark_blue },
    DiffDelete = { bg = c.dark_red, fg = c.light_red, bold = true },
    DiffText = { bg = c.dark_cyan },
    NonText = { fg = c.grey },
    TermCursor = { fg = c.black, bg = c.yellow },
    ErrorMsg = { fg = c.red, bold = true },
    WarningMsg = { fg = c.yellow, bold = true },
    WinSeparator = { fg = c.dark_grey },
    Folded = { bg = c.dark_blue, fg = c.blue },
    SignColumn = { fg = c.light_grey },
    LineNr = { fg = c.light_grey },
    CursorLineNr = { fg = c.yellow, bold = true },
    MatchParen = { fg = c.light_purple, bold = true },
    Search = { bg = c.dark_yellow, fg = c.yellow },
    ModeMsg = { fg = c.green },
    MoreMsg = { fg = c.white },
    NormalFloat = { link = "Normal" },
    FloatBorder = { fg = c.light_grey },
    Title = { fg = c.yellow, bold = true },
    Pmenu = { bg = c.darker_grey, fg = c.white },
    PmenuSel = { fg = c.black, bg = c.yellow },
    PmenuExtra = { fg = c.darker_white },
    PmenuSbar = { bg = c.dark_grey },
    PmenuThumb = { bg = c.dark_white },
    PmenuMatch = { underline = true },
    PmenuMatchSel = { underline = true, sp = c.black },
    Question = { fg = c.white },
    QuickFixLine = { bold = true },
    qfFileName = { fg = c.yellow },
    qfLineNr = { fg = c.darker_white },
    SpecialKey = { bg = c.dark_cyan, fg = c.cyan },
    SpellBad = { undercurl = true, sp = c.red },
    SpellCap = { undercurl = true, sp = c.yellow },
    SpellLocal = { undercurl = true, sp = c.green },
    SpellRare = { undercurl = true, sp = c.cyan },
    StatusLine = { bg = c.darker_grey, fg = c.white },
    StatusLineNC = { bg = c.dark_grey, fg = c.dark_white },
    Visual = { bg = c.dark_grey, bold = true },
    WinBar = { link = "StatusLine" },
    WinBarNC = { link = "StatusLineNC" },

    Comment = { fg = c.darker_white, italic = true },
    Function = { fg = c.yellow, bold = true },
    String = { fg = c.green },
    Identifier = { fg = c.white },
    StorageClass = { fg = c.white, bold = true },
    Type = { fg = c.lime },
    Constant = { fg = c.purple },
    Boolean = { link = "Constant" },
    Character = { link = "Constant" },
    Number = { fg = c.orange },
    -- Exception = { fg = c.red },
    Label = { fg = c.cyan },
    Operator = { fg = c.red },
    Special = { fg = c.light_cyan },
    Delimiter = { fg = c.white },
    Statement = { fg = c.purple },

    Error = { fg = c.black, bg = c.red },
    Added = { fg = c.green },
    Removed = { fg = c.red },
    Changed = { fg = c.light_blue },
    Keyword = { fg = c.orange },
    Structure = { fg = c.cyan },
    Todo = { fg = c.cyan },
    PreProc = { fg = c.dark_white, bold = true },

    -- Diagnostics
    DiagnosticError = { fg = c.red },
    DiagnosticWarn = { fg = c.yellow },
    DiagnosticInfo = { fg = c.light_blue },
    DiagnosticHint = { fg = c.cyan },
    DiagnosticOk = { fg = c.green },
    DiagnosticVirtualTextError = { fg = c.light_red, bg = c.dark_red },
    DiagnosticVirtualTextWarn = { fg = c.yellow, bg = c.dark_yellow },
    DiagnosticVirtualTextInfo = { fg = c.light_blue, bg = c.dark_blue },
    DiagnosticVirtualTextHint = { fg = c.cyan, bg = c.dark_cyan },
    DiagnosticVirtualTextOk = { fg = c.light_green, bg = c.dark_green },
    DiagnosticUnderlineError = { underline = true, sp = c.red },
    DiagnosticUnderlineWarn = { underline = true, sp = c.yellow },
    DiagnosticUnderlineInfo = { underline = true, sp = c.blue },
    DiagnosticUnderlineHint = { underline = true, sp = c.cyan },
    DiagnosticUnderlineOk = { underline = true, sp = c.green },
    DiagnosticDeprecated = { strikethrough = true, fg = c.darker_white },
    DiagnosticUnused = { link = "Comment" },
    DiagnosticSignError = { fg = c.red, bold = true },
    DiagnosticSignWarn = { fg = c.yellow, bold = true },
    DiagnosticSignInfo = { fg = c.light_blue, bold = true },
    DiagnosticSignHint = { fg = c.cyan, bold = true },
    DiagnosticSignOk = { fg = c.green, bold = true },

    -- LSP
    LspCodeLens = { fg = c.light_grey },
    LspCodeLensSeparator = { fg = c.grey },
    LspInlayHint = { bg = c.darker_grey, fg = c.light_grey },
    LspReferenceText = { bg = c.dark_grey },
    LspReferenceRead = { link = "LspReferenceText" },
    LspReferenceWrite = { link = "LspReferenceText" },
    LspSignatureActiveParameter = { bg = c.dark_grey, bold = true },

    -- Treesitter
    ["@variable"] = { fg = c.white },
    ["@markup.heading.1"] = { fg = c.yellow, bold = true },
    ["@markup.heading.2"] = { fg = c.orange, bold = true },
    ["@markup.heading.3"] = { fg = c.red, bold = true },
    ["@markup.heading.4"] = { fg = c.purple },
    ["@markup.heading.5"] = { fg = c.light_blue },
    ["@markup.heading.6"] = { fg = c.green },
    ["@markup.link"] = { underline = false },
    ["@markup.link.vimdoc"] = { underline = true },
    ["@markup.link.label"] = { underline = true },
    ["@markup.link.url"] = { fg = c.light_blue, underline = true },
    ["@markup.strikethrough"] = { strikethrough = true, fg = c.dark_white },
    ["@markup.quote"] = { fg = c.dark_white },
    ["@keyword.directive"] = { link = "PreProc" },
    ["@comment.error"] = { link = "DiagnosticError" },
    ["@comment.warning"] = { link = "DiagnosticWarn" },
    ["@comment.todo"] = { link = "Todo" },
    ["@comment.note"] = { link = "DiagnosticInfo" },

    -- LSP semantic tokens

    --- PLUGINS ---
    -- blink.cmp
    BlinkCmpMenu = { link = "NormalFloat" },
    BlinkCmpMenuBorder = { link = "FloatBorder" },
    BlinkCmpLabelMatch = { link = "PmenuMatch" },
    BlinkCmpKind = { link = "NormalFloat" },
    BlinkCmpKindFolder = { fg = c.orange },
    BlinkCmpKindFile = { fg = c.white },
    BlinkCmpKindText = { fg = c.dark_white },
    BlinkCmpKindMethod = { fg = c.yellow },
    BlinkCmpKindFunction = { fg = c.yellow },
    BlinkCmpKindField = { fg = c.light_blue },
    BlinkCmpKindVariable = { fg = c.white },
    BlinkCmpKindProperty = { fg = c.white },
    BlinkCmpKindClass = { fg = c.lime },
    BlinkCmpKindStruct = { fg = c.lime },
    BlinkCmpKindEnum = { fg = c.lime },
    BlinkCmpKindInterface = { fg = c.lime },
    BlinkCmpKindModule = { fg = c.cyan },
    BlinkCmpKindPackage = { fg = c.orange },
    BlinkCmpKindNameSpace = { fg = c.cyan },
    BlinkCmpKindObject = { fg = c.light_blue },
    BlinkCmpKindValue = { fg = c.purple },
    BlinkCmpKindNumber = { fg = c.purple },
    BlinkCmpKindConstant = { fg = c.purple },
    BlinkCmpKindEnumMember = { fg = c.purple },
    BlinkCmpKindNull = { fg = c.white },
    BlinkCmpKindSnippet = { fg = c.dark_white },
    BlinkCmpKindColor = { fg = c.red },
    BlinkCmpKindKeyword = { fg = c.orange },
    BlinkCmpKindString = { fg = c.green },
    BlinkCmpKindTypeParameter = { fg = c.lime },
    BlinkCmpKindEvent = { fg = c.yellow },
    BlinkCmpKindOperator = { fg = c.red },
    BlinkCmpKindReference = { fg = c.light_cyan },

    -- lazy.nvim
    LazyButtonActive = { bg = c.grey, bold = true },
    LazyReasonEvent = { fg = c.yellow },
    LazyReasonFt = { fg = c.cyan },
    LazyReasonImport = { fg = c.green },

    -- leap.nvim
    LeapBackdrop = { fg = c.darker_white },

    -- mini.icons
    MiniIconsAzure = { fg = c.light_blue },
    MiniIconsBlue = { fg = c.blue },
    MiniIconsCyan = { fg = c.cyan },
    MiniIconsGreen = { fg = c.green },
    MiniIconsGrey = { fg = c.dark_white },
    MiniIconsOrange = { fg = c.orange },
    MiniIconsPurple = { fg = c.purple },
    MiniIconsRed = { fg = c.red },
    MiniIconsYellow = { fg = c.yellow },

    -- treesitter-context
    TreesitterContextBottom = { underline = true, sp = c.grey },
    TreesitterContextLineNumber = { fg = c.darker_white },

    -- vim-illuminate
    IlluminatedWordText = { bg = c.dark_grey },
    IlluminatedWordRead = { link = "IlluminatedWordText" },
    IlluminatedWordWrite = { link = "IlluminatedWordText" },

    -- oil.nvim
    OilHidden = { fg = c.darker_white },
    OilLink = { fg = c.cyan },
    OilCreate = { fg = c.green },
    OilMove = { fg = c.light_blue },
    OilCopy = { fg = c.cyan },
    OilChange = { fg = c.yellow },
    OilRestore = { fg = c.green },
    OilPurge = { link = "Error" },
}

function M.load()
    if not editing then -- hi clear removes nvim-colorizer colors
        vim.cmd.highlight("clear")
    end
    vim.cmd.syntax("reset")

    vim.o.termguicolors = true
    vim.o.background = "dark"
    vim.g.colors_name = "kky"

    for name, val in pairs(highlights) do
        vim.api.nvim_set_hl(0, name, val)
    end

    vim.g.terminal_color_0 = c.black
    vim.g.terminal_color_1 = c.red
    vim.g.terminal_color_2 = c.green
    vim.g.terminal_color_3 = c.yellow
    vim.g.terminal_color_4 = c.blue
    vim.g.terminal_color_5 = c.purple
    vim.g.terminal_color_6 = c.cyan
    vim.g.terminal_color_7 = c.dark_white
    vim.g.terminal_color_8 = c.grey
    vim.g.terminal_color_9 = c.light_red
    vim.g.terminal_color_10 = c.light_green
    vim.g.terminal_color_11 = c.light_yellow
    vim.g.terminal_color_12 = c.light_blue
    vim.g.terminal_color_13 = c.light_purple
    vim.g.terminal_color_14 = c.light_cyan
    vim.g.terminal_color_15 = c.white
end

if editing then -- reload theme with :so
    M.load()
end

return M
