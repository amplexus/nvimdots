-- Workaround for https://github.com/jose-elias-alvarez/null-ls.nvim/issues/428 "warning: multiple different client offset_encodings detected for buffer, this is not supported yet"
return {
	capabilities = {
		offsetEncoding = "utf-8",
	},
}
