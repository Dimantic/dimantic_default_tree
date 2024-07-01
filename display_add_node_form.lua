

local node_id = tonumber(get_post_data().node_id)
local is_root_node = node_id == 0

if is_root_node then 

  local node_id = Html.HiddenInput.new(
    'node_id', 
    node_id
  )
  local reload_on_success = true
  local submit_button =  Html.SubmitButton.new(
    'Send form', 
    "__overlay__",
    reload_on_success
  )
  local text_input = Html.Textinput.new(
    "node_name", 
    "node name ...", 
    "Enter the name of the node"
  )
  local select_node_type = Html.SelectInput.new(
    "node_type",
    "1",
    "Type of the node",
    {
      {
        value = "0",
        label = "Default"
      },
      {
        value = "1",
        label = "Search"
      },
    }
    
  )
  local form = Html.Form.new(
    'create_new_node',
     {
       node_id,
       text_input,
       select_node_type,
       submit_button
     }
  )   
 Html.render(form)
  
else
  print("IS NOT the correct node id...")
  print(node_id)  
end  