-- help

local help = require("help")
local octf = require("rc.octf")
local textutils = require("textutils")

local args = {...}

if #args == 0 then
  args[1] = "help"
end

local function view(path)
  textutils.coloredPagedPrint(table.unpack(assert(
    octf.reader(path)):init():read()))
end

for i=1, #args, 1 do
  local path = help.lookup(args[i])
  if not path then
    error("No help topic for " .. args[i], 0)
  end
  view(path)
end
