<?php
declare(strict_types=1);

// FooterYearUpdate SDK utility: prepare_body

class FooterYearUpdatePrepareBody
{
    public static function call(FooterYearUpdateContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
