-- import null-ls plugin safely
local setup, null_ls = pcall(require, "null-ls")
if not setup then
  return
end
