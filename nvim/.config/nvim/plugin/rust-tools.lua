local present, rusttools = pcall(require, "rusttools")
if not present then return end
require('rust-tools').setup(--[[ opts ]])
