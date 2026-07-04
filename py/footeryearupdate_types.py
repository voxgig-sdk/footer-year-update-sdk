# Typed models for the FooterYearUpdate SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.

from __future__ import annotations

from dataclasses import dataclass
from typing import Optional, Any


@dataclass
class Year:
    sponsored_by: str
    year: int
    year_string: str


@dataclass
class YearLoadMatch:
    sponsored_by: Optional[str] = None
    year: Optional[int] = None
    year_string: Optional[str] = None

