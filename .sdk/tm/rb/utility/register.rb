# FooterYearUpdate SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

FooterYearUpdateUtility.registrar = ->(u) {
  u.clean = FooterYearUpdateUtilities::Clean
  u.done = FooterYearUpdateUtilities::Done
  u.make_error = FooterYearUpdateUtilities::MakeError
  u.feature_add = FooterYearUpdateUtilities::FeatureAdd
  u.feature_hook = FooterYearUpdateUtilities::FeatureHook
  u.feature_init = FooterYearUpdateUtilities::FeatureInit
  u.fetcher = FooterYearUpdateUtilities::Fetcher
  u.make_fetch_def = FooterYearUpdateUtilities::MakeFetchDef
  u.make_context = FooterYearUpdateUtilities::MakeContext
  u.make_options = FooterYearUpdateUtilities::MakeOptions
  u.make_request = FooterYearUpdateUtilities::MakeRequest
  u.make_response = FooterYearUpdateUtilities::MakeResponse
  u.make_result = FooterYearUpdateUtilities::MakeResult
  u.make_point = FooterYearUpdateUtilities::MakePoint
  u.make_spec = FooterYearUpdateUtilities::MakeSpec
  u.make_url = FooterYearUpdateUtilities::MakeUrl
  u.param = FooterYearUpdateUtilities::Param
  u.prepare_auth = FooterYearUpdateUtilities::PrepareAuth
  u.prepare_body = FooterYearUpdateUtilities::PrepareBody
  u.prepare_headers = FooterYearUpdateUtilities::PrepareHeaders
  u.prepare_method = FooterYearUpdateUtilities::PrepareMethod
  u.prepare_params = FooterYearUpdateUtilities::PrepareParams
  u.prepare_path = FooterYearUpdateUtilities::PreparePath
  u.prepare_query = FooterYearUpdateUtilities::PrepareQuery
  u.result_basic = FooterYearUpdateUtilities::ResultBasic
  u.result_body = FooterYearUpdateUtilities::ResultBody
  u.result_headers = FooterYearUpdateUtilities::ResultHeaders
  u.transform_request = FooterYearUpdateUtilities::TransformRequest
  u.transform_response = FooterYearUpdateUtilities::TransformResponse
}
