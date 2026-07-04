-- ProjectName SDK configuration

local function make_config()
  return {
    main = {
      name = "FooterYearUpdate",
    },
    feature = {
      ["test"] = {
        ["options"] = {
          ["active"] = false,
        },
      },
    },
    options = {
      base = "https://getfullyear.com/api",
      headers = {
        ["content-type"] = "application/json",
      },
      entity = {
        ["year"] = {},
      },
    },
    entity = {
      ["year"] = {
        ["fields"] = {
          {
            ["active"] = true,
            ["name"] = "sponsored_by",
            ["req"] = true,
            ["type"] = "`$STRING`",
            ["index$"] = 0,
          },
          {
            ["active"] = true,
            ["name"] = "year",
            ["req"] = true,
            ["type"] = "`$INTEGER`",
            ["index$"] = 1,
          },
          {
            ["active"] = true,
            ["name"] = "year_string",
            ["req"] = true,
            ["type"] = "`$STRING`",
            ["index$"] = 2,
          },
        },
        ["name"] = "year",
        ["op"] = {
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["active"] = true,
                ["args"] = {},
                ["method"] = "GET",
                ["orig"] = "/year",
                ["parts"] = {
                  "year",
                },
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.year`",
                },
                ["index$"] = 0,
              },
            },
            ["key$"] = "load",
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
    },
  }
end


local function make_feature(name)
  local features = require("features")
  local factory = features[name]
  if factory ~= nil then
    return factory()
  end
  return features.base()
end


-- Attach make_feature to the SDK class
local function setup_sdk(SDK)
  SDK._make_feature = make_feature
end


return make_config
