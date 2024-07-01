print("<pre>", Utils.table_to_string(Context.request), "</pre>")

local node_id = tonumber(get_post_data().node_id)
local parent_node_id = 0 -- no parent is 0
local content = get_post_data().node_name
local author_id = Context.request.user_id
local node_type = Context.request.post.node_type
print("Author-id", Context.request.user_id)
print(" --- ---- -- <br> ")
local result = Node.Node.create_new_node(
  parent_node_id, 
  content, 
  author_id,
  tonumber(node_type)
)
print(" --- ---- -- <br> ")
if Problem.onerr(result) == nil then return end
local result2 = Node.Node.create_new_node(
  result.id,
  "Child of " .. content,
  author_id,
  0 
)
if Problem.onerr(result2) == nil then return end

print(" --- ---- -- <br> ")
if Problem.onerr(result2) == nil then return end
local result3 = Node.Node.create_new_node(
  result2.id,
  "Child of Child of " .. content,
  author_id,
  0
)
if Problem.onerr(result3) == nil then return end 