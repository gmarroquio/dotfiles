local utils = {}

function utils.dumpTable(o)
  if type(o) == "table" then
    local s = "{ "
    for k, v in pairs(o) do
      if type(k) ~= "number" then
        k = '"' .. k .. '"'
      end
      s = s .. "[" .. k .. "] = " .. utils.dumpTable(v) .. ","
    end
    return s .. "} "
  else
    return tostring(o)
  end
end

function utils.read_file_as_string(filename)
  local file = io.open(filename, "r")
  if not file then return nil end -- Handle file not found or permission issues

  local content = file:read("*all")
  file:close()

  return content
end

return utils
