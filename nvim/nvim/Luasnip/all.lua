return {
  -- A simple "Hello, world!" text node
  s(
    { trig = "hi" }, -- Table of snippet parameters
    {                -- Table of snippet nodes
      t("Hello, world!")
    }
  ),

  s("trig", {
    i(1), t "text", i(2), t "text again", i(3)
  }),
}
