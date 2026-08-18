
import { BaseFeature } from './feature/base/BaseFeature'
import { TestFeature } from './feature/test/TestFeature'



const FEATURE_CLASS: Record<string, typeof BaseFeature> = {
   test: TestFeature,

}


class Config {

  makeFeature(this: any, fn: string) {
    const fc = FEATURE_CLASS[fn]
    const fi = new fc()
    // TODO: errors etc
    return fi
  }


  main = {
    name: 'FooterYearUpdate',
  }


  feature = {
     test:     {
      "options": {
        "active": false
      }
    },

  }


  options = {
    base: "https://getfullyear.com/api",

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
          "name": "sponsored_by",
          "req": true,
          "type": "`$STRING`"
        },
        {
          "name": "year",
          "req": true,
          "type": "`$INTEGER`"
        },
        {
          "name": "year_string",
          "req": true,
          "type": "`$STRING`"
        }
      ],
      "name": "year",
      "op": {
        "load": {
          "input": "data",
          "name": "load",
          "points": [
            {
              "args": {},
              "kind": "http",
              "method": "GET",
              "orig": "/year",
              "parts": [
                "year"
              ],
              "select": {},
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
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

