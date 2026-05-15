<?php
declare(strict_types=1);

// FooterYearUpdate SDK utility: result_body

class FooterYearUpdateResultBody
{
    public static function call(FooterYearUpdateContext $ctx): ?FooterYearUpdateResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
