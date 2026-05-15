
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { FooterYearUpdateSDK } from '..'


describe('exists', async () => {

  test('test-mode', async () => {
    const testsdk = await FooterYearUpdateSDK.test()
    equal(null !== testsdk, true)
  })

})
