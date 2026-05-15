# ProjectName SDK exists test

import pytest
from footeryearupdate_sdk import FooterYearUpdateSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = FooterYearUpdateSDK.test(None, None)
        assert testsdk is not None
