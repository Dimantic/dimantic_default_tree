function hello()
  print("hello from share")
end  

Share = {}

------------------------------------------------------------
-- This function displays a form for creating a paragraph.
------------------------------------------------------------
function Share.create_paragraph_form_and_handle() 
  do
    local textarea
    do
      local name = "paragraph_content"
      local value = ""
      local label = "Paragraph-Content"
      textarea = Html.Textarea.new(name, value, label)
    end
  
    local hidden_input
    do 
      local name = "create_paragraph"
      local value = "true"
      hidden_input = Html.HiddenInput.new(name, value)
    end 
  
    local hidden_input_node_id
    do 
      local name = "node_id"
      local value = Context.request.post.node_id
      hidden_input_node_id = Html.HiddenInput.new(name, value)
    end 
  
    local submit_button
    do 
      local name = "Create paragraph"
      local render_target = "__canvas__" -- "__canvas__", "__overlay__"
      local reload_on_success = false
      local icon = "fas fa-plus-square"
      submit_button = Html.SubmitButton.new(
        name, render_target, reload_on_success, icon)
    end
  
    local form
    do 
      local handler_name = "select_node"
      local children = {
        textarea,
        hidden_input,
        hidden_input_node_id,
        submit_button
      }
      local form_header = "Create new Paragraph"
  
      form = Html.Form.new(handler_name, children, form_header)
    end
  
    -- if we get the request we handle it
    -- otherwise, we just render the form
    if Context.request.post.create_paragraph then
  
      local content = Context.request.post.paragraph_content
      local node_id = Context.request.post.node_id
      local new_paragraph = Content.Paragraph.new(node_id, content)
      new_paragraph:save()
      local html_element = new_paragraph:to_html_element()
      Html.render(html_element)
    
    else 
 
      Html.render(form)
    
    end 
  end
  
end 


function Share.edit_paragraph_form(paragraph_id) 

end 


function Share.delete_paragraph(paragraph_id)

end

 