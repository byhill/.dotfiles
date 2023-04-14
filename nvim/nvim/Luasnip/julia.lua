---@diagnostic disable: undefined-global

local b = conds.line_begin

local not_comment = function(_, matched_trigger)
    local _, row, col, _, _ = unpack(vim.fn.getcurpos())
    local node = vim.treesitter.get_node({
        pos = { row - 1, col - #matched_trigger - 1 },
    })
    return node and node:type() ~= "string_literal"
end

return {
    s({ trig = "if", desc = "if-block" }, fmt([[
      if {}
          {}
      end
    ]], { i(1), i(2, "nothing") }),
        { condition = b * not_comment }
    ),

    s({ trig = "function", desc = "function-block" }, fmt([[
      function {}({})
          {}
      end
    ]], { i(1, "f"), i(2), i(0, "return false") }),
        { condition = b * not_comment }
    ),

    s({ trig = "for", desc = "for-block" }, fmt([[
      for {} in {}
          {}
      end
    ]], { i(1, "i"), i(2, "iter"), i(3, "nothing") }),
        { condition = b * not_comment }
    ),

    s({ trig = "??", desc = "Ternary operator" }, fmt([[
      {} ? {} : {}
  ]], { i(1, "true"), i(2, "nothing"), i(3, "nothing") })
    ),

    s({ trig = "div ", snippetType = "autosnippet" }, t("÷ ")),
    s({ trig = "div=", snippetType = "autosnippet" }, t("÷=")),
    s({ trig = "pe_setup", desc = "Boilerplate code for a project euler problem" }, fmt([[
      module Problem{}


      """
          problem{}()

      Problem {} of Project Euler.

      [https://projecteuler.net/problem={}](https://projecteuler.net/problem={})
      """
      function problem{}()
        {}
      end


      export problem{}
      end  # module Problem{}
      using .Problem{}
      export problem{}
      ]], { i(1), rep(1), rep(1), rep(1), rep(1), rep(1), i(0, "return 0"), rep(1), rep(1), rep(1), rep(1) }),
        { condition = b }
    ),
}
