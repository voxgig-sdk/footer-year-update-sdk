# FooterYearUpdate SDK utility: feature_add
module FooterYearUpdateUtilities
  FeatureAdd = ->(ctx, f) {
    ctx.client.features << f
  }
end
