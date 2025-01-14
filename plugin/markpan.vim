
if exists('g:loaded_markpan')
  finish
endif

let g:loaded_markpan = 1

" let g:pandoc#syntax#newlines = 1
let g:pandoc#syntax#style#emphases = 1
"       let g:pandoc#syntax#codeblocks#embeds#langs = ["ruby",
"       "literatehaskell=lhaskell", "bash=sh"]
" vim.g['pandoc#syntax#codeblocks#embeds#langs'] = {
"   'awk',
"   'bash=sh',
"   'c',
"   'cpp',
"   'css',
"   'go',
"   'html',
"   'ini=dosini',
"   'java',
"   'javascript',
"   'json',
"   'kotlin',
"   'lua',
"   'python',
"   'python3=python',
"   'pycon=python',
"   'pycon3=python',
"   'ruby',
"   'rust',
"   'sh',
"   'shell=sh',
"   'sql',
"   'terraform',
"   'ts=typescript',
"   'vim',
"   'xml',
"   'yaml',
"   'zsh',
" }


" vim-pandoc-syntax*
" *pandoc-syntax*
"
" OVERVIEW
"
" vim-pandoc-syntax is a standalone syntax file for highlighting pandoc flavored
" markdown documents, to be used alongside vim-pandoc (see |pandoc|). It is
" based on the version once provided by vim-pandoc-legacy, which it obsoletes.
"
" The project resides at http://www.github.com/vim-pandoc/vim-pandoc-syntax. You
" are welcome to help, suggest ideas, report bugs or contribute code.
"
"
" CONFIGURATION				       *vim-pandoc-syntax-configuration*
"
" + *g:pandoc#syntax#conceal#use*
"   Use |conceal| for pretty highlighting. Default is 1 for vim version > 7.3
  "
  " + *g:pandoc#syntax#conceal#blacklist* A list of rules |conceal| should not be
  "   used with. Works as a blacklist, and defaults to [] (use conceal everywhere).
  "
  "   This is a list of the rules wich can be used here:
  "
  "   - titleblock
  "   - image
  "   - block
  "   - subscript
  "   - superscript
  "   - strikeout
  "   - atx
  "   - codeblock_start
  "   - codeblock_delim
  "   - footnote
  "   - definition
  "   - list
  "   - newline
  "   - dashes
  "   - ellipses
  "   - quotes
  "   - inlinecode
  "   - inlinemath
  "
  "   To review what are the rules for, look for the call to |s:WithConceal| in
  "   syntax/pandoc.vim that takes the corresponding  rulename as first argument.
  "
  " + *g:pandoc#syntax#conceal#cchar_overrides*
  "   A dictionary of what characters should be used in conceal rules. These
  "   override the defaults (see those in |s:cchars|). For example, if you prefer
  "   to mark footnotes with the `*` symbol:
  "
  "       let g:pandoc#syntax#conceal#cchar_overrides = {"footnote" : "*"}
  "
  " + *g:pandoc#syntax#conceal#urls*
  "   Conceal the urls in links.
  "
  " + *g:pandoc#syntax#codeblocks#ignore*
  "   Prevent highlighting specific codeblock types so that they remain Normal.
  "   Codeblock types include 'definition' for codeblocks inside definition blocks
  "   and 'delimited' for delimited codeblocks. Default = []
  "
  " + *g:pandoc#syntax#codeblocks#embeds#use*
  "   Use embedded highlighting for delimited codeblocks where a language is
  "   specified. Default = 1
  "
  " + *g:pandoc#syntax#codeblocks#embeds#langs*
  "   For what languages and using what syntax files to highlight embeds. This is
  "   a list of language names. When the language pandoc and vim use don't match,
  "   you can use the "PANDOC=VIM" syntax. For example:
  "
  "       let g:pandoc#syntax#codeblocks#embeds#langs = ["ruby",
  "       "literatehaskell=lhaskell", "bash=sh"]
  "
  " + *g:pandoc#syntax#style#emphases*
  "   Use italics and strong in emphases. Default = 1
  "   0 will add "block" to |g:pandoc#syntax#conceal#blacklist|, because otherwise
  "   you couldn't tell where the styles are applied.
  "
  " + *g:pandoc#syntax#style#underline_special*
  "   Underline subscript, superscript and strikeout text styles. Default = 1
  "
  " + *g:pandoc#syntax#style#use_definition_lists*
  "   Detect and highlight definition lists. Disabling this can improve
  "   performance. Default = 1 (i.e., enabled by default)
  "
  " COMMANDS                                            *pandoc-syntax-commands*
  "
  " + *:PandocHighlight* LANG
  "
  "   Enable embedded highlighting for language LANG in codeblocks. Uses the
  "   syntax for items in |g:pandoc#syntax#codeblocks#embeds#langs|.
  "
  " + *:PandocUnhighlight* LANG
  "
  "   Disable embedded highlighting for language LANG in codeblocks.
  "
  " FUNCTIONS                                           *pandoc-syntax-functions*
  "
  " + *EnableEmbedsForCodeblocksWithLang(langname)*
  "   As |:PandocHighlight|.
  "
  " + *DisableEmbedsForCodeblocksWithLang(langname)*
  "   As |:PandocUnhighlight|.
  "
  " + *s:WithConceal(RULE_GROUP,RULE,CONCEAL_RULE)*
  "   Executes a |:syntax| command RULE, which could incorporate conceal rules
  "   (CONCEAL_RULE) if  conceals are enabled. The rule gets named RULE_GROUP,
  "   as used in |g:pandoc#syntax#conceal#blacklist|.
  "
  "   For example, if conceals are enabled
  "
  "       call s:WithConceal("atx", 'syn match AtxStart /#/ contained
  "           containedin=pandocAtxHeader', 'conceal cchar='.s:cchars["atx"])
  "
  "   will execute
  "
  "       syn match AtxStart /#/ contained containedin=pandocAtxHeader conceal cchar=§
  "
  "   and
  "
  "       syn match AtxStart /#/ contained containedin=pandocAtxHeader
  "
  "   otherwise.
  "
  " TODO
  "
  " This is a list of know stuff missing from the syntax file.
  "
  "    1. Highlight code within verbatim text when a language is specified in the attrib,
  "    like in
  "
  "           hey, `print 1 + 3`.{python} is no longer valid in python 3.
  "
  "
  " MISC
  "
  " The plugin sets a global variable, *g:vim_pandoc_syntax_exists* to indicate its
  " existence. This is currently used by vim-pandoc to switch between syntax
  " assisted and basic folding rules.
