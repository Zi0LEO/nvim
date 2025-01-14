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
  s({trig="be", dscr="expands to begin an environment", snippetType="autosnippet"},
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

  s({trig="it", dscr="italic", snippetType="autosnippet"},
    fmta("\\textit{<>}",
      {
        d(1, get_visual),
      }
    )
  ),
}
