# FooterYearUpdate SDK configuration

module FooterYearUpdateConfig
  def self.make_config
    {
      "main" => {
        "name" => "FooterYearUpdate",
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
        },
      },
      "options" => {
        "base" => "https://getfullyear.com/api",
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "year" => {},
        },
      },
      "entity" => {
        "year" => {
          "fields" => [
            {
              "active" => true,
              "name" => "sponsored_by",
              "req" => true,
              "type" => "`$STRING`",
              "index$" => 0,
            },
            {
              "active" => true,
              "name" => "year",
              "req" => true,
              "type" => "`$INTEGER`",
              "index$" => 1,
            },
            {
              "active" => true,
              "name" => "year_string",
              "req" => true,
              "type" => "`$STRING`",
              "index$" => 2,
            },
          ],
          "name" => "year",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "active" => true,
                  "args" => {},
                  "method" => "GET",
                  "orig" => "/year",
                  "parts" => [
                    "year",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.year`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "load",
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    FooterYearUpdateFeatures.make_feature(name)
  end
end
