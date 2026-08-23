
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

  // False for a feature added at runtime via options.extend (station's
  // adopt path) - the constructor uses this to skip makeFeature for names
  // no generated class backs.
  hasFeature(this: any, fn: string) {
    return null != FEATURE_CLASS[fn]
  }


  main = {
    name: 'FooterYearUpdate',
        slug: "footer-year-update",
    version: "0.0.1",
    target: "ts",

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
          "short": "Sponsored message (required to be displayed/logged per Terms of Service for free tier users)",
          "type": "`$STRING`"
        },
        {
          "name": "year",
          "req": true,
          "short": "The current year as an integer",
          "type": "`$INTEGER`"
        },
        {
          "name": "year_string",
          "req": true,
          "short": "The current year as a string",
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

