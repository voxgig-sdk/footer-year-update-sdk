# frozen_string_literal: true

# Typed models for the FooterYearUpdate SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# Year entity data model.
#
# @!attribute [rw] sponsored_by
#   @return [String]
#
# @!attribute [rw] year
#   @return [Integer]
#
# @!attribute [rw] year_string
#   @return [String]
Year = Struct.new(
  :sponsored_by,
  :year,
  :year_string,
  keyword_init: true
)

# Match filter for Year#load (any subset of Year fields).
#
# @!attribute [rw] sponsored_by
#   @return [String, nil]
#
# @!attribute [rw] year
#   @return [Integer, nil]
#
# @!attribute [rw] year_string
#   @return [String, nil]
YearLoadMatch = Struct.new(
  :sponsored_by,
  :year,
  :year_string,
  keyword_init: true
)

