package = "voxgig-sdk-footer-year-update"
version = "0.0-1"
source = {
  url = "git://github.com/voxgig-sdk/footer-year-update-sdk.git"
}
description = {
  summary = "FooterYearUpdate SDK for Lua",
  license = "MIT"
}
dependencies = {
  "lua >= 5.3",
  "dkjson >= 2.5",
  "dkjson >= 2.5",
}
build = {
  type = "builtin",
  modules = {
    ["footer-year-update_sdk"] = "footer-year-update_sdk.lua",
    ["config"] = "config.lua",
    ["features"] = "features.lua",
  }
}
