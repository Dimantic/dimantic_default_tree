
local post = Context.request.post
print("<pre>", Utils.table_to_string(post), "</pre>")

local id = Context.request.post.paragraph_id
local p = Content.Paragraph.get_by_id(tonumber(id))


-- Put here a form to edit the paragraph ...

 local textarea
    do
      local name = "paragraph_content"
      local value = p.content
      local label = "Paragraph-Content"
      textarea = Html.Textarea.new(name, value, label)
    end
  
    local hidden_input
    do 
      local name = "update_paragraph"
      local value = "true"
      hidden_input = Html.HiddenInput.new(name, value)
    end 
  
    local hidden_input_paragraph_id
    do 
      local name = "paragraph_id"
      local value = p.id
      hidden_input_node_id = Html.HiddenInput.new(name, value)
    end 
  
    local submit_button
    do 
      local name = "Save Edit"
      local render_target = "__overlay__" -- "__canvas__", "__overlay__"
      local reload_on_success = false
      local icon = "fas fa-plus-square"
      submit_button = Html.SubmitButton.new(
        name, render_target, reload_on_success, icon)
    end
  
    local form
    do 
      local handler_name = "update_paragraph"
      local children = {
        textarea,
        hidden_input,
        hidden_input_node_id,
        submit_button
      }
      local form_header = "Update Paragraph Content"
  
      form = Html.Form.new(handler_name, children, form_header)
    end
 
    Html.render(form)


if Context.request.post.update_paragraph then 

  p.content = Context.request.post.paragraph_content
  p:save()
  
end   

Html.render(p:to_html_element())


 