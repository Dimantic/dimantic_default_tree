print ("new paragraph saved ... (todo)")
print("<pre>")
print_table(get_post_data())
print("</pre>") 
print ("GOT NODE: "..get_post_data().node_id)
local node_id = tonumber(get_post_data().node_id)
local nodes = get_content_entries_of_node(node_id)
local content = get_post_data().p_content

local highest_order = 0
for i, node in ipairs(nodes) do 
  print("<pre>")
  print_table(node)
  print("</pre>") 
  highest_order = math.max(highest_order, tonumber(node.order_id) or 0)
end

print("highest order")
print(highest_order)

local tree_id = get_tree_id()
create_content(tree_id, node_id, content, highest_order + 1)

 