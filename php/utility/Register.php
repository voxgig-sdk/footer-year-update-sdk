<?php
declare(strict_types=1);

// FooterYearUpdate SDK utility registration

require_once __DIR__ . '/../core/UtilityType.php';
require_once __DIR__ . '/Clean.php';
require_once __DIR__ . '/Done.php';
require_once __DIR__ . '/MakeError.php';
require_once __DIR__ . '/FeatureAdd.php';
require_once __DIR__ . '/FeatureHook.php';
require_once __DIR__ . '/FeatureInit.php';
require_once __DIR__ . '/Fetcher.php';
require_once __DIR__ . '/MakeFetchDef.php';
require_once __DIR__ . '/MakeContext.php';
require_once __DIR__ . '/MakeOptions.php';
require_once __DIR__ . '/MakeRequest.php';
require_once __DIR__ . '/MakeResponse.php';
require_once __DIR__ . '/MakeResult.php';
require_once __DIR__ . '/MakePoint.php';
require_once __DIR__ . '/MakeSpec.php';
require_once __DIR__ . '/MakeUrl.php';
require_once __DIR__ . '/Param.php';
require_once __DIR__ . '/PrepareAuth.php';
require_once __DIR__ . '/PrepareBody.php';
require_once __DIR__ . '/PrepareHeaders.php';
require_once __DIR__ . '/PrepareMethod.php';
require_once __DIR__ . '/PrepareParams.php';
require_once __DIR__ . '/PreparePath.php';
require_once __DIR__ . '/PrepareQuery.php';
require_once __DIR__ . '/ResultBasic.php';
require_once __DIR__ . '/ResultBody.php';
require_once __DIR__ . '/ResultHeaders.php';
require_once __DIR__ . '/TransformRequest.php';
require_once __DIR__ . '/TransformResponse.php';

FooterYearUpdateUtility::setRegistrar(function (FooterYearUpdateUtility $u): void {
    $u->clean = [FooterYearUpdateClean::class, 'call'];
    $u->done = [FooterYearUpdateDone::class, 'call'];
    $u->make_error = [FooterYearUpdateMakeError::class, 'call'];
    $u->feature_add = [FooterYearUpdateFeatureAdd::class, 'call'];
    $u->feature_hook = [FooterYearUpdateFeatureHook::class, 'call'];
    $u->feature_init = [FooterYearUpdateFeatureInit::class, 'call'];
    $u->fetcher = [FooterYearUpdateFetcher::class, 'call'];
    $u->make_fetch_def = [FooterYearUpdateMakeFetchDef::class, 'call'];
    $u->make_context = [FooterYearUpdateMakeContext::class, 'call'];
    $u->make_options = [FooterYearUpdateMakeOptions::class, 'call'];
    $u->make_request = [FooterYearUpdateMakeRequest::class, 'call'];
    $u->make_response = [FooterYearUpdateMakeResponse::class, 'call'];
    $u->make_result = [FooterYearUpdateMakeResult::class, 'call'];
    $u->make_point = [FooterYearUpdateMakePoint::class, 'call'];
    $u->make_spec = [FooterYearUpdateMakeSpec::class, 'call'];
    $u->make_url = [FooterYearUpdateMakeUrl::class, 'call'];
    $u->param = [FooterYearUpdateParam::class, 'call'];
    $u->prepare_auth = [FooterYearUpdatePrepareAuth::class, 'call'];
    $u->prepare_body = [FooterYearUpdatePrepareBody::class, 'call'];
    $u->prepare_headers = [FooterYearUpdatePrepareHeaders::class, 'call'];
    $u->prepare_method = [FooterYearUpdatePrepareMethod::class, 'call'];
    $u->prepare_params = [FooterYearUpdatePrepareParams::class, 'call'];
    $u->prepare_path = [FooterYearUpdatePreparePath::class, 'call'];
    $u->prepare_query = [FooterYearUpdatePrepareQuery::class, 'call'];
    $u->result_basic = [FooterYearUpdateResultBasic::class, 'call'];
    $u->result_body = [FooterYearUpdateResultBody::class, 'call'];
    $u->result_headers = [FooterYearUpdateResultHeaders::class, 'call'];
    $u->transform_request = [FooterYearUpdateTransformRequest::class, 'call'];
    $u->transform_response = [FooterYearUpdateTransformResponse::class, 'call'];
});
