print("FORM UM EINEN PARAGRAPEHMN ZU ERSTELLEN")

local node_id = Context.request.post.node_id
local textarea = make_textarea_form_field("p_content","your content ...", 5, 80)
local content = Html.Textinput.new("p_content", "", "Content of paragraph")
local submit = Html.SubmitButton.new("Add Paragraph", "__overlay__")
local hidden_node_id = Html.HiddenInput.new("node_id", node_id)

local form = Html.Form.new(
  "save_new_paragraph", 
  {
    hidden_node_id,
    content,
    submit
  }
)

Html.render(form)

return;
--[[
local node_id = get_post_data().node_id
put_call_handler_form('save_new_paragraph','+ Add Paragraph' ,{
  node_id = node_id
}, {textarea}, "__overlay__")
]]
