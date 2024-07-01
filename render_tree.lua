--render_tree()
hello()
local tree_id = Context.request.tree_id
print(tree_id, "<hr>")
local root_node = Node.get_root_node() 
root_node.content = "Dimantic-Wurst"
root_node.node_type = "3"

local other_nodes = Node.get_nodes_of_tree()

local all_nodes = {root_node}
for _, node in ipairs(other_nodes) do 
  table.insert(all_nodes, node)
end

Node.render_tree(all_nodes, {
  ["0"] = "fas fa-align-justify",
  ["1"] = "fas fa-search",
  ["3"] = "fas fa-play"
})
 