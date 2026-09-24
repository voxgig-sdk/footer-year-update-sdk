

import Path from 'node:path'
import * as Fs from 'node:fs'

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'
import { createLiveTransport } from '../../live-runner'
import { runLiveEntity } from '../../live-entity'


import { FooterYearUpdateSDK, BaseFeature, stdutil } from '../../..'

import {
  envOverride,
  liveClientOptions,
  liveDelay,
  loadEnvLocal,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
  maybeSkipControl,
} from '../../utility'


loadEnvLocal(__dirname + '/../../../.env.local')


describe('YearEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when FOOTER_YEAR_UPDATE_TEST_LIVE=TRUE.
  afterEach(liveDelay('FOOTER_YEAR_UPDATE_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = FooterYearUpdateSDK.test()
    const ent = testsdk.Year()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.FOOTER_YEAR_UPDATE_TEST_LIVE
    for (const op of ['load']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'year.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"sponsored_by":{"a":true,"h":"Sponsored By","n":"sponsored_by","r":true,"sh":"Sponsored message (required to be displayed/logged per Terms of Service for free tier users)","t":"`$STRING`","key$":"sponsored_by","index$":0},"year":{"a":true,"h":"Year","n":"year","r":true,"sh":"The current year as an integer","t":"`$INTEGER`","key$":"year","index$":1},"year_string":{"a":true,"h":"Year String","n":"year_string","r":true,"sh":"The current year as a string","t":"`$STRING`","key$":"year_string","index$":2}},"name":"year","op":{"load":{"input":"data","name":"load","points":[{"a":true,"co":{"id":"GET /year","source":"openapi3","version":2},"g":{},"k":"http","m":"GET","o":"/year","q":{},"r":{},"s":[{"lit":"year"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"load"}},"relations":{"ancestors":[]},"key$":"year","name__orig":"year","Name":"Year","name_":"year","name-":"year","NAME":"YEAR","index$":0}, {"active":true,"entity":"year","key$":"BasicYearFlow","kind":"basic","name":"BasicYearFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"year_ref01","srcdatavar":"year_ref01_data","suffix":"_dt0"},"m":{},"o":"load","s":[],"v":[{"apply":"TextFieldMark","def":{"mark":"Mark01-year_ref01"}}],"index$":0}]}, 'Year', {"GET /year":{"protocol":"http","operationId":"getCurrentYear","responses":{"200":{"description":"Successful response with current year information","content":{"application/json":{"schema":{"type":"object","required":["year","year_string","sponsored_by"],"properties":{"year":{"description":"The current year as an integer","example":2025,"key$":"year","type":"integer"},"year_string":{"description":"The current year as a string","example":"2025","key$":"year_string","type":"string"},"sponsored_by":{"description":"Sponsored message (required to be displayed/logged per Terms of Service for free tier users)","example":"Viagra: standing tall and proud","key$":"sponsored_by","type":"string"}},"x-ref":"#/components/schemas/YearResponse","index$":0},"examples":{"success":{"value":{"year":2025,"year_string":"2025","sponsored_by":"Viagra: standing tall and proud"}}}}}},"500":{"description":"Internal server error","content":{"application/json":{"schema":{"type":"object","properties":{"error":{"type":"string","description":"Error message describing what went wrong"},"message":{"type":"string","description":"Detailed error information"}},"x-ref":"#/components/schemas/Error"}}}},"503":{"description":"Service unavailable - may occur during year transitions or maintenance","content":{"application/json":{"schema":{"type":"object","properties":{"error":{"type":"string","description":"Error message describing what went wrong"},"message":{"type":"string","description":"Detailed error information"}},"x-ref":"#/components/schemas/Error"}}}}},"parameters":[],"securitySource":"unspecified"}})
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let year_ref01_data = Object.values(setup.data.existing.year)[0] as any

    // LOAD
    const year_ref01_ent = client.Year()
    const year_ref01_match_dt0: any = {}
    const year_ref01_data_dt0 = (await year_ref01_ent.load(year_ref01_match_dt0)).data()
    assert(null != year_ref01_data_dt0)


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/year/YearTestData.json')

  // TODO: file ready util needed?
  const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8')

  // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
  const entityData = JSON.parse(entityDataSource)

  options.entity = entityData.existing

  let client = FooterYearUpdateSDK.test(options, extra)
  const struct = client.utility().struct
  const merge = struct.merge
  const transform = struct.transform

  let idmap = transform(
    ['year01','year02','year03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'FOOTER_YEAR_UPDATE_TEST_YEAR_ENTID': idmap,
    'FOOTER_YEAR_UPDATE_TEST_LIVE': 'FALSE',
    'FOOTER_YEAR_UPDATE_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['FOOTER_YEAR_UPDATE_TEST_YEAR_ENTID']

  const live = 'TRUE' === env.FOOTER_YEAR_UPDATE_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['FOOTER_YEAR_UPDATE_TEST_YEAR_ENTID']
    idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {}
    if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
      throw new Error('Live ENTID must be a JSON object')
    }
    client = new FooterYearUpdateSDK(merge([
      // FIRST, so the generated fields below win: sdk-test-control.json's
      // test.client.options adds to the live client, it does not redirect it.
      liveClientOptions(),
      {
      },
      // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when the
      // last entry is undefined, and basicSetup is normally called with no
      // argument at all - so a bare 'extra' silently discarded the apikey
      // and server values above and handed the SDK undefined. Harmless
      // while there was nothing in that object; not harmless now.
      extra || {},
      { system: { fetch: transport.fetch } }
    ]))
  }

  const setup = {
    idmap,
    env,
    options,
    client,
    struct,
    data: entityData,
    explain: 'TRUE' === env.FOOTER_YEAR_UPDATE_TEST_EXPLAIN,
    live,
    transport,
    now: Date.now(),
  }

  return setup
}
  
