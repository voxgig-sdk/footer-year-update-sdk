
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { FooterYearUpdateSDK } from '..'


describe('exists', async () => {

  test('test-mode', () => {
    const testsdk = FooterYearUpdateSDK.test()
    equal(testsdk instanceof FooterYearUpdateSDK, true,
      'FooterYearUpdateSDK.test() must return a client synchronously')
  })

})
