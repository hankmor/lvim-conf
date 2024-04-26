local status_ok, surround = pcall(require, "nvim-surround")
if not status_ok then
  return
end

-- Old text                    Command         New text
--------------------------------------------------------------------------------
-- local str = H*ello          ysiw"           local str = "Hello"
-- require"nvim-surroun*d"     ysa")           require("nvim-surround")
-- char c = *x;                ysl'            char c = 'x';
-- int a[] = *32;              yst;}           int a[] = {32};
-- surr*ound_words             ysiw)           (surround_words)
-- *make strings               ys$"            "make strings"
-- [delete ar*ound me!]        ds]             delete around me!
-- remove <b>HTML t*ags</b>    dst             remove HTML tags
-- 'change quot*es'            cs'"            "change quotes"
-- <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
-- delete(functi*on calls)     dsf             function calls
surround.setup {}
