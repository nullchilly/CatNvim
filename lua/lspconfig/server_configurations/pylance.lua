local function get_pylance()
	local version = "2023.7.20" -- Last known pylance version that works well
	local download_url = string.format(
		"https://ms-python.gallery.vsassets.io/_apis/public/gallery/publisher/ms-python/extension/vscode-pylance/%s/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage",
		version
	)
	local pylance_path = vim.fn.stdpath("cache") .. "/pylance/"
	if vim.fn.isdirectory(pylance_path .. version) == 0 then
		vim.fn.mkdir(pylance_path, "p")
		os.execute(
			string.format(
				[[cd %s && wget %s -O %s.zip &&
        unzip %s.zip -d %s && rm -r %s.zip && cd %s
        awk -i inplace 'BEGIN{RS=ORS=";"} /if\(!process/{sub(/return!0x1/, "return!0x0")} 1' extension/dist/server.bundle.js]],
				pylance_path,
				download_url,
				version,
				version,
				version,
				version,
				version
			)
		)
	end
	return string.format("%s%s/extension/dist/server.bundle.js", pylance_path, version)
end

local util = require("lspconfig.util")

local root_files = {
	"pyproject.toml",
	"setup.py",
	"setup.cfg",
	"requirements.txt",
	"Pipfile",
}

return {
	default_config = {
		cmd = {
			"node",
			get_pylance(),
			"--stdio",
		},
		filetypes = { "python" },
		single_file_support = true,
		root_dir = util.root_pattern(unpack(root_files)),
		settings = {
			python = {
				analysis = {},
			},
		},
	},
}
