# FooterYearUpdate SDK utility: make_context
require_relative '../core/context'
module FooterYearUpdateUtilities
  MakeContext = ->(ctxmap, basectx) {
    FooterYearUpdateContext.new(ctxmap, basectx)
  }
end
