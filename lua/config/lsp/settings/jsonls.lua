local status, schemastore = pcall(require, "schemastore")

if not status then
	return
end

return {
	settings = {
		json = {
			schemas = schemastore.json.schemas(),
			validate = { enable = true },
		},
	},
}

