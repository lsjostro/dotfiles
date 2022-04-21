local M = {}

function M.auto_format_lsp()
	local id, client = next(vim.lsp.buf_get_clients())
	if id ~= nil and client.resolved_capabilities.document_formatting then
		vim.lsp.buf.formatting_sync(nil, 100)
	end
end

return M
