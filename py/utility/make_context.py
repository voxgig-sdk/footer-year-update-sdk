# FooterYearUpdate SDK utility: make_context

from core.context import FooterYearUpdateContext


def make_context_util(ctxmap, basectx):
    return FooterYearUpdateContext(ctxmap, basectx)
