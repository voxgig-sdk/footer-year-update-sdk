<?php
declare(strict_types=1);

// FooterYearUpdate SDK configuration

class FooterYearUpdateConfig
{
    /** @var array<string,mixed>|null */
    private static ?array $shared_config = null;

    /**
     * Return the process-wide config, built once on first use. The SDK reads
     * the config on every request and never writes to it, so one instance is
     * shared by every client rather than rebuilt per client.
     *
     * PHP arrays are copy-on-write, so callers that do mutate the result get
     * their own copy and cannot disturb the shared one.
     */
    public static function shared_config(): array
    {
        if (self::$shared_config === null) {
            self::$shared_config = self::make_config();
        }
        return self::$shared_config;
    }

    /**
     * Build a fresh, fully materialised config array. Every call rebuilds the
     * whole structure, so prefer shared_config unless you need a private copy.
     */
    public static function make_config(): array
    {
        return [
            "main" => [
                "name" => "FooterYearUpdate",
                "slug" => "footer-year-update",
                "version" => "0.0.1",
                "target" => "php",
            ],
            "feature" => [
                "test" => [
          'options' => [
            'active' => false,
          ],
          'transport' => 'base',
        ],
            ],
            "options" => [
                "base" => "https://getfullyear.com/api",
                "headers" => [
          'content-type' => 'application/json',
        ],
                "entity" => [
                    "year" => [],
                ],
            ],
            "entity" => [
        'year' => [
          'fields' => [
            [
              'name' => 'sponsored_by',
              'req' => true,
              'short' => 'Sponsored message (required to be displayed/logged per Terms of Service for free tier users)',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'year',
              'req' => true,
              'short' => 'The current year as an integer',
              'type' => '`$INTEGER`',
            ],
            [
              'name' => 'year_string',
              'req' => true,
              'short' => 'The current year as a string',
              'type' => '`$STRING`',
            ],
          ],
          'name' => 'year',
          'op' => [
            'load' => [
              'input' => 'data',
              'name' => 'load',
              'points' => [
                [
                  'args' => [],
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/year',
                  'parts' => [
                    'year',
                  ],
                  'select' => [],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                ],
              ],
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
      ],
        ];
    }


    public static function make_feature(string $name)
    {
        require_once __DIR__ . '/features.php';
        return FooterYearUpdateFeatures::make_feature($name);
    }
}
