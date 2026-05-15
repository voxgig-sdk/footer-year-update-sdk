<?php
declare(strict_types=1);

// FooterYearUpdate SDK configuration

class FooterYearUpdateConfig
{
    public static function make_config(): array
    {
        return [
            "main" => [
                "name" => "FooterYearUpdate",
            ],
            "feature" => [
                "test" => [
          'options' => [
            'active' => false,
          ],
        ],
            ],
            "options" => [
                "base" => "https://getfullyear.com/api",
                "auth" => [
                    "prefix" => "Bearer",
                ],
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
              'type' => '`$STRING`',
              'active' => true,
              'index$' => 0,
            ],
            [
              'name' => 'year',
              'req' => true,
              'type' => '`$INTEGER`',
              'active' => true,
              'index$' => 1,
            ],
            [
              'name' => 'year_string',
              'req' => true,
              'type' => '`$STRING`',
              'active' => true,
              'index$' => 2,
            ],
          ],
          'name' => 'year',
          'op' => [
            'load' => [
              'name' => 'load',
              'points' => [
                [
                  'method' => 'GET',
                  'orig' => '/year',
                  'parts' => [
                    'year',
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'active' => true,
                  'args' => [],
                  'select' => [],
                  'index$' => 0,
                ],
              ],
              'input' => 'data',
              'key$' => 'load',
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
