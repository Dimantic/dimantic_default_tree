local post = get_post_data()

local node_id = post.node_id 



if post.get_data then

  print("<pre>")
  print_table(post)
  print("</pre>")
  print("RECEIVED POST DATA")

  print(post.lol)

end   

local name = "Send Button"
local render_target = "__overlay__"
local button = Html.SubmitButton.new(name, render_target)

local name = "get_data"
local value = "true"
local hidden_field = Html.HiddenInput.new(name, value)

local name = "lol"
local value = "CONTENT"
local label =  "Label des Textarea"
local textarea = Html.Textarea.new(name, value, label)

local handler_name = "edit_paragraph"
local children = {
  textarea,
  hidden_field,
  button,
  
}
local form = Html.Form.new(handler_name, children, {})

print(Html.render(form)) 