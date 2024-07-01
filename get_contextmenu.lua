
--print("<pre>")
--print_table(get_post_data())
local node_id = tonumber(get_post_data().node_id)
--print( node_id )
local is_root_node = node_id == 0

if is_root_node then 
  do 
    local node_id = Html.HiddenInput.new('node_id', node_id)
    local submit_button =  Html.SubmitButton.new(
      ' + Add Node',     
      '__overlay__', -- render target
      false, -- reload on success 
      "fas fa-paragraph" -- icon of submit button
    )
    local form = Html.Form.new(
      'display_add_node_form',
       {
         node_id,
         submit_button
       }
    )   
    -- print("<pre>" .. Utils.table_to_string(form) .. "</pre>")
    Html.render(form)
  end
   
else

  -- load node here and check what the user is allowed to do ...

  -- DELETE BUTTON
  do 
    local node_id = Html.HiddenInput.new('node_id', node_id)
    local submit_button =  Html.SubmitButton.new(
      ' Delete Node ',     
      '__overlay__' -- render target todo: make render target "__reload__"
    )
    local form = Html.Form.new(
      'delete_node',
       {
         node_id,
         submit_button
       }
    )   
    -- print("<pre>" .. Utils.table_to_string(form) .. "</pre>")
    Html.render(form)
  end  
  
  -- ADD PARAGRPH BUTTON 
  do 
    local node_id = Html.HiddenInput.new('node_id', node_id)
    local submit_button =  Html.SubmitButton.new(
      ' + Add paragraph ',     
      '__overlay__' -- render target todo: make render target "__reload__"
    )
    local form = Html.Form.new(
      'add_paragraph',
       {
         node_id,
         submit_button
       }
    )   
    -- print("<pre>" .. Utils.table_to_string(form) .. "</pre>")
    Html.render(form)
  end 
  
end 