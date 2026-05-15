<?php
declare(strict_types=1);

// FooterYearUpdate SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class FooterYearUpdateFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new FooterYearUpdateBaseFeature();
            case "test":
                return new FooterYearUpdateTestFeature();
            default:
                return new FooterYearUpdateBaseFeature();
        }
    }
}
