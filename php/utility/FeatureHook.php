<?php
declare(strict_types=1);

// FooterYearUpdate SDK utility: feature_hook

class FooterYearUpdateFeatureHook
{
    public static function call(FooterYearUpdateContext $ctx, string $name): void
    {
        if (!$ctx->client) {
            return;
        }
        $features = $ctx->client->features ?? null;
        if (!$features) {
            return;
        }
        foreach ($features as $f) {
            if (method_exists($f, $name)) {
                $f->$name($ctx);
            }
        }
    }
}
