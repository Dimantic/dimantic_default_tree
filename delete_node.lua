

local post = Context.request.post
print("<pre>", Utils.table_to_string(post), "<pre>")


local node = Node.get_node_by_id(tonumber(post.node_id))

node:delete()

 