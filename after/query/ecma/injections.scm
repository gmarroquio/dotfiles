(call_expression
  (member_expression
    (identifier) @_styled
    (#eq? @_styled "styled"))
  (template_string) @css (#offset! @css 0 1 0 -1))

(call_expression
  (member_expression
    (identifier) @_createGlobalStyle
    (#eq? @_createGlobalStyle "createGlobalStyle"))
  (template_string) @css (#offset! @css 0 1 0 -1))
