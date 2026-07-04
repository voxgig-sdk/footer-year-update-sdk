
import { BaseFeature } from './feature/base/BaseFeature'
import { TestFeature } from './feature/test/TestFeature'



const FEATURE_CLASS: Record<string, typeof BaseFeature> = {
   test: TestFeature

}


class Config {

  makeFeature(this: any, fn: string) {
    const fc = FEATURE_CLASS[fn]
    const fi = new fc()
    // TODO: errors etc
    return fi
  }


  main = {
    name: 'ProjectName',
  }


  feature = {
     test:     {
      "options": {
        "active": false
      }
    }

  }


  options = {
    base: 'https://getfullyear.com/api',

    headers: {
      "content-type": "application/json"
    },

    entity: {
      
      year: {
      },

    }
  }


  entity = {
    "year": {
      "fields": [
        {
          "active": true,
          "name": "sponsored_by",
          "req": true,
          "type": "`$STRING`",
          "index$": 0
        },
        {
          "active": true,
          "name": "year",
          "req": true,
          "type": "`$INTEGER`",
          "index$": 1
        },
        {
          "active": true,
          "name": "year_string",
          "req": true,
          "type": "`$STRING`",
          "index$": 2
        }
      ],
      "name": "year",
      "op": {
        "load": {
          "input": "data",
          "name": "load",
          "points": [
            {
              "active": true,
              "args": {},
              "method": "GET",
              "orig": "/year",
              "parts": [
                "year"
              ],
              "select": {},
              "transform": {
                "req": "`reqdata`",
                "res": "`body.year`"
              },
              "index$": 0
            }
          ],
          "key$": "load"
        }
      },
      "relations": {
        "ancestors": []
      }
    }
  }
}


const config = new Config()

export {
  config
}

