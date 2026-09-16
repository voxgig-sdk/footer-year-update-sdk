# FooterYearUpdate SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/ratelimit_feature'
require_relative 'feature/retry_feature'
require_relative 'feature/test_feature'
require_relative 'feature/timeout_feature'


module FooterYearUpdateFeatures
  def self.make_feature(name)
    case name
    when "base"
      FooterYearUpdateBaseFeature.new
    when "ratelimit"
      FooterYearUpdateRatelimitFeature.new
    when "retry"
      FooterYearUpdateRetryFeature.new
    when "test"
      FooterYearUpdateTestFeature.new
    when "timeout"
      FooterYearUpdateTimeoutFeature.new
    else
      FooterYearUpdateBaseFeature.new
    end
  end
end
