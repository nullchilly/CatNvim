local modules = {
	"packer",
	"stabilize",
	"ibus",
}

for _, module in pairs(modules) do
	require("utils." .. module)
end
