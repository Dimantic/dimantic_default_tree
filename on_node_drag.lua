print("NODE WURDE GEDRAGT")
local post = Context.request.post
print("<pre>", Utils.table_to_string(post), "<pre>") 

local dragged_node = Node.get_node_by_id(tonumber(post.from))
local old_parent_node = Node.get_node_by_id(dragged_node.parent_id)



local id_to_drag_to = 0
if tonumber(post.to) == 0 then 
  
else  
  local to_node = Node.get_node_by_id(tonumber(post.to))
  id_to_drag_to = tonumber(post.to)
end 

dragged_node:move_to_new_parent(id_to_drag_to)


 