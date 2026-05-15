-- FooterYearUpdate SDK error

local FooterYearUpdateError = {}
FooterYearUpdateError.__index = FooterYearUpdateError


function FooterYearUpdateError.new(code, msg, ctx)
  local self = setmetatable({}, FooterYearUpdateError)
  self.is_sdk_error = true
  self.sdk = "FooterYearUpdate"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function FooterYearUpdateError:error()
  return self.msg
end


function FooterYearUpdateError:__tostring()
  return self.msg
end


return FooterYearUpdateError
