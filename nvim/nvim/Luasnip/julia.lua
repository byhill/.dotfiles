---@diagnostic disable: undefined-global

local a = "autosnippet"
local b = conds.line_begin

local not_comment = function(_, matched_trigger)
    local _, row, col, _, _ = unpack(vim.fn.getcurpos())
    local node = vim.treesitter.get_node({
        pos = { row - 1, col - #matched_trigger - 1 },
    })
    return node and node:type() ~= "string_literal"
end

return {
    s({ trig = "if ", snippetType = a, desc = "if-block" }, fmt([[
        if {}
            {}
        end
    ]], { i(1), i(2, "nothing") }),
        { condition = b * not_comment }
    ),

    s({ trig = "function", snippetType = a, desc = "function-block" }, fmt([[
        function {}({})
            {}
        end
    ]], { i(1, "f"), i(2), i(0, "return false") }),
        { condition = b * not_comment }
    ),

    s({ trig = "while ", snippetType = a, desc = "while-block" }, fmt([[
        while {}
            {}
        end
    ]], { i(1, "true"), i(2, "nothing") }),
        { condition = b * not_comment }
    ),

    s({ trig = "for", snippetType = a, desc = "for-block" }, fmt([[
      for {} in {}
          {}
      end
    ]], { i(1, "i"), i(2, "iter"), i(3, "nothing") }),
        { condition = b * not_comment }
    ),

    s({ trig = "??", snippetType = a, desc = "Ternary operator" }, fmt([[
      {} ? {} : {}
  ]], { i(1, "true"), i(2, "nothing"), i(3, "nothing") })
    ),
    s({ trig = "\\oplus", snippetType = a }, t("⊕")),
    s({ trig = "oplus", snippetType = a }, t("⊕")),
    s({ trig = "o+", snippetType = a }, t("⊕")),
    s({ trig = "\\ominus", snippetType = a }, t("⊖")),
    s({ trig = "ominus", snippetType = a }, t("⊖")),
    s({ trig = "o-", snippetType = a }, t("⊖")),
    s({ trig = "\\odot", snippetType = a }, t("⊙")),
    s({ trig = "odot", snippetType = a }, t("⊙")),
    s({ trig = "o*", snippetType = a }, t("⊙")),
    s({ trig = "\\upparrow", snippetType = a }, t("↑")),
    s({ trig = "upparrow", snippetType = a }, t("↑")),
    s({ trig = "\\o^", snippetType = a, wordTrig = false }, t("↑")),
    s({ trig = "o^", snippetType = a }, t("↑")),


    -- Operators
    s({ trig = "div ", snippetType = a }, t("÷ ")),
    s({ trig = "\\div", wordTrig = false, snippetType = a }, t("÷ ")),
    s({ trig = "div=", snippetType = a }, t("÷=")),
    s({ trig = "<=", snippetType = a }, t("≤")),
    s({ trig = ">=", snippetType = a }, t("≥")),
    s({ trig = "!=", snippetType = a }, t("≠")),

    -- Subscripts, see https://docs.julialang.org/en/v1/manual/unicode-input/
    s({ trig = "_0", snippetType = a, wordTrig = false, desc = "Subscript 0" }, t("₀")),
    s({ trig = "_1", snippetType = a, wordTrig = false, desc = "Subscript 1" }, t("₁")),
    s({ trig = "_2", snippetType = a, wordTrig = false, desc = "Subscript 2" }, t("₂")),
    s({ trig = "_3", snippetType = a, wordTrig = false, desc = "Subscript 3" }, t("₃")),
    s({ trig = "_4", snippetType = a, wordTrig = false, desc = "Subscript 4" }, t("₄")),
    s({ trig = "_5", snippetType = a, wordTrig = false, desc = "Subscript 5" }, t("₅")),
    s({ trig = "_6", snippetType = a, wordTrig = false, desc = "Subscript 6" }, t("₆")),
    s({ trig = "_7", snippetType = a, wordTrig = false, desc = "Subscript 7" }, t("₇")),
    s({ trig = "_8", snippetType = a, wordTrig = false, desc = "Subscript 8" }, t("₈")),
    s({ trig = "_9", snippetType = a, wordTrig = false, desc = "Subscript 9" }, t("₉")),

    -- Greek Letters, see https://docs.julialang.org/en/v1/manual/unicode-input/
    s({ trig = ",D", snippetType = a, desc = "\\Delta" }, t("Δ")),
    s({ trig = ",G", snippetType = a, desc = "\\Gamma" }, t("Γ")),
    s({ trig = ",L", snippetType = a, desc = "\\Lambda" }, t("λ")),
    s({ trig = ",P", snippetType = a, desc = "\\Pi" }, t("Π")),
    s({ trig = ",S", snippetType = a, desc = "\\Sigma" }, t("L")),
    s({ trig = ",a", snippetType = a, desc = "\\alpha" }, t("α")),
    s({ trig = ",b", snippetType = a, desc = "\\beta" }, t("β")),
    s({ trig = ",d", snippetType = a, desc = "\\delta" }, t("δ")),
    s({ trig = ",e", snippetType = a, desc = "\\varepsilon" }, t("ε")),
    s({ trig = ",f", snippetType = a, desc = "\\phi" }, t("ϕ")),
    s({ trig = ",l", snippetType = a, desc = "\\lambda" }, t("λ")),
    s({ trig = ",p", snippetType = a, desc = "\\pi" }, t("π")),
    s({ trig = ",q", snippetType = a, desc = "\\theta" }, t("θ")),
    s({ trig = ",s", snippetType = a, desc = "\\sigma" }, t("σ")),
    s({ trig = ",t", snippetType = a, desc = "\\tau" }, t("τ")),
    s({ trig = ",w", snippetType = a, desc = "\\omega" }, t("ω")),
    s({ trig = ",y", snippetType = a, desc = "\\psi" }, t("ψ")),
    s({ trig = ",z", snippetType = a, desc = "\\zeta" }, t("ζ")),
    s({ trig = ",ve", snippetType = a, desc = "\\epsilon" }, t("ϵ")),
    s({ trig = ",vf", snippetType = a, desc = "\\varphi" }, t("φ")),

    -- PE setup
    s({ trig = "pe_setup", desc = "Boilerplate code for a project euler problem" }, fmt([[
        module Problem{}


        """
            problem{}()

        Problem {} of Project Euler.

        https://projecteuler.net/problem={}
        """
        function problem{}()
            {}
        end


        export problem{}
        end  # module Problem{}
        using .Problem{}
        export problem{}
      ]], { i(1), i(2), i(3), i(4), rep(1), i(0, "return 0"), rep(1), rep(1), rep(1), rep(1) }),
        { condition = b }
    ),
}
