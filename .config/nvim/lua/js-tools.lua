local M = {}

local config_files = {
	eslint = {
		"eslint.config.js",
		"eslint.config.mjs",
		"eslint.config.cjs",
		"eslint.config.ts",
		"eslint.config.mts",
		"eslint.config.cts",
		".eslintrc",
		".eslintrc.js",
		".eslintrc.cjs",
		".eslintrc.json",
		".eslintrc.yaml",
		".eslintrc.yml",
	},
	oxlint = { ".oxlintrc.json", ".oxlintrc.jsonc", "oxlint.config.ts" },
	oxfmt = { ".oxfmtrc.json", ".oxfmtrc.jsonc", "oxfmt.config.ts" },
}

function M.uses(tool, bufnr)
	return vim.fs.root(bufnr, config_files[tool]) ~= nil
end

function M.linters(bufnr)
	local linters = {}
	if M.uses("oxlint", bufnr) then
		table.insert(linters, "oxlint")
	end
	if M.uses("eslint", bufnr) then
		table.insert(linters, "eslint_d")
	end
	return linters
end

function M.formatter(bufnr)
	return M.uses("oxfmt", bufnr) and "oxfmt" or "prettier"
end

return M
