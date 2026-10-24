# FooterYearUpdate SDK utility: prepare_body
require_relative 'media'
module FooterYearUpdateUtilities
  PrepareBody = ->(ctx) {
    return nil unless ctx.op.input == "data"
    return FooterYearUpdateUtilities.raw_body(ctx.reqdata) if FooterYearUpdateUtilities.raw_request?(ctx.point)
    ctx.utility.transform_request.call(ctx)
  }
end
