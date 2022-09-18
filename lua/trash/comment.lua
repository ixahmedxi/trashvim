local comment = safe_require("Comment")
local comment_utils = safe_require("Comment.utils")
local commentstring_utils = safe_require("ts_context_commentstring.utils")
local commentstring_internal = safe_require("ts_context_commentstring.internal")

if not comment then
	return
end

if not comment_utils then
	return
end

if not commentstring_utils then
	return
end

if not commentstring_internal then
	return
end

comment.setup({
	pre_hook = function(ctx)
		local U = comment_utils

		local location = nil
		if ctx.ctype == U.ctype.block then
			location = commentstring_utils.get_cursor_location()
		elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
			location = commentstring_utils.get_visual_start_location()
		end

		return commentstring_internal.calculate_commentstring({
			key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
			location = location,
		})
	end,
})
