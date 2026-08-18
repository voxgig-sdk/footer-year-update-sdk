-- FooterYearUpdate SDK configuration

-- Build a fresh, fully materialised config table. Every call rebuilds the
-- whole structure, so prefer require("config_shared") unless you need a
-- private copy you intend to mutate.
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
            ["name"] = "sponsored_by",
            ["req"] = true,
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "year",
            ["req"] = true,
            ["type"] = "`$INTEGER`",
          },
          {
            ["name"] = "year_string",
            ["req"] = true,
            ["type"] = "`$STRING`",
          },
        },
        ["name"] = "year",
        ["op"] = {
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/year",
                ["parts"] = {
                  "year",
                },
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
              },
            },
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
