# FooterYearUpdate SDK configuration

module FooterYearUpdateConfig
  # Return the process-wide config, built once on first use. The SDK reads
  # the config on every request and never writes to it, so one instance is
  # shared by every client rather than rebuilt per client.
  #
  # The returned hash is shared: treat it as read-only. Callers that need to
  # mutate should use make_config, which always returns a fresh copy.
  def self.shared_config
    @shared_config ||= make_config
  end


  # Build a fresh, fully materialised config hash. Every call rebuilds the
  # whole structure, so prefer shared_config unless you need a private copy
  # you intend to mutate.
  def self.make_config
    {
      "main" => {
        "name" => "FooterYearUpdate",
        "slug" => "footer-year-update",
        "version" => "0.0.1",
        "target" => "rb",
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
              "name" => "sponsored_by",
              "req" => true,
              "short" => "Sponsored message (required to be displayed/logged per Terms of Service for free tier users)",
              "type" => "`$STRING`",
            },
            {
              "name" => "year",
              "req" => true,
              "short" => "The current year as an integer",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "year_string",
              "req" => true,
              "short" => "The current year as a string",
              "type" => "`$STRING`",
            },
          ],
          "name" => "year",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/year",
                  "parts" => [
                    "year",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
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
