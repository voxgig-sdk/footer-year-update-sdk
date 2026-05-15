<?php
declare(strict_types=1);

// FooterYearUpdate SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class FooterYearUpdateMakeContext
{
    public static function call(array $ctxmap, ?FooterYearUpdateContext $basectx): FooterYearUpdateContext
    {
        return new FooterYearUpdateContext($ctxmap, $basectx);
    }
}
