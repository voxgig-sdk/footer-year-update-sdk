<?php
declare(strict_types=1);

// FooterYearUpdate SDK utility: prepare_path

class FooterYearUpdatePreparePath
{
    public static function call(FooterYearUpdateContext $ctx): string
    {
        $point = $ctx->point;
        $parts = [];
        if ($point) {
            $p = \Voxgig\Struct\Struct::getprop($point, 'parts');
            if (is_array($p)) {
                $parts = $p;
            }
        }
        return \Voxgig\Struct\Struct::join($parts, '/', true);
    }
}
