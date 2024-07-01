local probddd = Problem.Problem.new(
   "Bad Value", 
   "some_value is bigger than 10 which is not allowed", 
   {some_value = 12345}
)

print("Hallo johannes")

if Context.request.post.node_id == nil then 
  Problem.panic(
    "Post field node_id is nil",
    "Missing post field 'node_id'",
    Context.request.post
  )
end  



local post = Context.request.post
print("<pre>", Utils.table_to_string(post), "</pre>") 


if post.node_id == "0" then 
  print("ROOT NODE OF TREE")
  return
end 

local node = Node.get_node_by_id(tonumber(post.node_id))
--print("<pre>", Utils.table_to_string(node), "</pre>") 

if Context.request.post.delete_paragraph then 
  do 
    local paragraph_id = Context.request.post.paragraph_id 
    local p = Content.Paragraph.get_by_id(tonumber(paragraph_id))
    p:delete()
  end 
end

if node.node_type == "0" then

  local paragraphs 
    = Content.Paragraph.get_all_from_node(
        tonumber(post.node_id)
      )

  for _, p in ipairs(paragraphs) do
    local html_element = p:to_html_element()
    Html.render(html_element)
    
    local can_edit = true -- todo
    if can_edit then
      do 
    
      local hidden_input
      do 
        local name = "paragraph_id"
        local value = p.id
        hidden_input = Html.HiddenInput.new(name, value)
      end 
    
      local submit_button
      do 
        local name = "Edit"
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
          hidden_input,
          submit_button
        }
        local form_header = nil
  
        form = Html.Form.new(handler_name, children, form_header)
      end
      
      Html.render(form)
      end 
      
      -------------------------------------------------------
      -- DELETE FORM 
      -------------------------------------------------------
      do 
      
        local hidden_input
        do 
          local name = "paragraph_id"
          local value = p.id
          hidden_input = Html.HiddenInput.new(name, value)
        end 
        
        local hidden_input_2
        do 
          local name = "delete_paragraph"
          local value = "true"
          hidden_input_2 = Html.HiddenInput.new(name, value)
        end 
        
        local hidden_input_node_id
        do 
          local name = "node_id"
          local value = Context.request.post.node_id
          hidden_input_node_id = Html.HiddenInput.new(name, value)
        end 
    
        local submit_button
        do 
          local name = "Delete"
          local render_target = "__canvas__" -- "__canvas__", "__overlay__"
          local reload_on_success = false
          local icon = "fas fa-trash-alt"
          submit_button = Html.SubmitButton.new(
            name, render_target, reload_on_success, icon)
        end
  
        local form
        do 
          local handler_name = "select_node"
          local children = {
            hidden_input,
            hidden_input_2,
            hidden_input_node_id,
            submit_button
          }
          local form_header = nil
  
          form = Html.Form.new(handler_name, children, form_header)
        end
      
        Html.render(form)
     
      end
    end 
  end
  

  do
    
    -- if we get the request we handle it
    if Context.request.post.create_paragraph then
      do 
        local content = Context.request.post.paragraph_content
        local node_id = Context.request.post.node_id
        local content_type = Context.request.post.content_type
        local new_paragraph 
          = Content.Paragraph.new(node_id, content, content_type)
        new_paragraph:save()
        local html_element = new_paragraph:to_html_element()
        Html.render(html_element)
      end 
    end
  
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
    
    local type_select 
    do 
      local name = "content_type"
      local value = 0
      local label = "Content-type"
      local options = {
        {
          label = "Paragraph",
          value = 0
        },
        {
          label = "Link",
          value = 1
        },
        {
          label = "ImageLink",
          value = 2
        },
        {
          label = "YoutubeLink",
          value = 3
        },
        {
          label = "Header",
          value = 4
        }
      }
      type_select = Html.SelectInput.new(name, value, label, options)
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
        type_select,
        submit_button
      }
      local form_header = "Create new Paragraph"
  
      form = Html.Form.new(handler_name, children, form_header)
    end
 
    Html.render(form)
     
  end
   
elseif node.node_type == "1" then 

  print("SEARCH")   
    
end    


    
