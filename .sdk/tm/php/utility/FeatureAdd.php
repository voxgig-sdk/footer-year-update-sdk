<?php
declare(strict_types=1);

// FooterYearUpdate SDK utility: feature_add

class FooterYearUpdateFeatureAdd
{
    public static function call(FooterYearUpdateContext $ctx, mixed $f): void
    {
        $ctx->client->features[] = $f;
    }
}
