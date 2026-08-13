# FooterYearUpdate SDK feature factory

from footeryearupdate_sdk.feature.base_feature import FooterYearUpdateBaseFeature
from footeryearupdate_sdk.feature.test_feature import FooterYearUpdateTestFeature


def _make_feature(name):
    features = {
        "base": lambda: FooterYearUpdateBaseFeature(),
        "test": lambda: FooterYearUpdateTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
