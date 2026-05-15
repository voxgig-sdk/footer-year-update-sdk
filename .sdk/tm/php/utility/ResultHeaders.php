<?php
declare(strict_types=1);

// FooterYearUpdate SDK utility: result_headers

class FooterYearUpdateResultHeaders
{
    public static function call(FooterYearUpdateContext $ctx): ?FooterYearUpdateResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
