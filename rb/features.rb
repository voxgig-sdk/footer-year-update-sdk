# FooterYearUpdate SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module FooterYearUpdateFeatures
  def self.make_feature(name)
    case name
    when "base"
      FooterYearUpdateBaseFeature.new
    when "test"
      FooterYearUpdateTestFeature.new
    else
      FooterYearUpdateBaseFeature.new
    end
  end
end
