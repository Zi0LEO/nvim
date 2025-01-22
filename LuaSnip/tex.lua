-- Summary: When `LS_SELECT_RAW` is populated with a visual selection, the function
-- returns an insert node whose initial text is set to the visual selection.
-- When `LS_SELECT_RAW` is empty, the function simply returns an empty insert node.

local get_visual = function(args, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else  -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

return {
  s(
    {trig="b_", dscr="expands to begin an environment", snippetType="autosnippet"},
    fmta(
      [[
        \begin{<>}
          <>
        \end{<>}
      ]],
      {
        i(1, "type of environment"),
        i(0),
        rep(1),
      }
    )
  ),

  s(
    {trig="it_", dscr="italic", snippetType="autosnippet"},
    fmta("\\textit{<>}",
      {
        d(1, get_visual),
      }
    )
  ),
  s(
    {trig="bf", dscr="bold", snippetType="autosnippet"},
    fmta("\\textbf{<>}",
      {
        d(1, get_visual),
      }
    )
  ),
  s(
    {trig="ul", dscr="underline", snippetType="autosnippet"},
    fmta("\\underline{<>}",
      {
        d(1, get_visual),
      }
    )
  ),
  s(
    {trig="s_", dscr="section", snippetType="autosnippet"},
    fmta("\\section{<>}",
      {
        d(1, get_visual),
      }
    )
  ),
  s(
    {trig="ss_", dscr="subsection", snippetType="autosnippet"},
    fmta("\\subsection{<>}",
      {
        d(1, get_visual),
      }
    )
  ),
  s(
    {trig="sss_", dscr="subsubsection", snippetType="autosnippet"},
    fmta("\\subsubsection{<>}",
      {
        d(1, get_visual),
      }
    )
  ),
}
