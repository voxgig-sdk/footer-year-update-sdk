# FooterYearUpdate SDK configuration


def make_config():
    return {
        "main": {
            "name": "FooterYearUpdate",
        },
        "feature": {
            "test": {
        "options": {
          "active": False,
        },
      },
        },
        "options": {
            "base": "https://getfullyear.com/api",
            "auth": {
                "prefix": "Bearer",
            },
            "headers": {
        "content-type": "application/json",
      },
            "entity": {
                "year": {},
            },
        },
        "entity": {
      "year": {
        "fields": [
          {
            "name": "sponsored_by",
            "req": True,
            "type": "`$STRING`",
            "active": True,
            "index$": 0,
          },
          {
            "name": "year",
            "req": True,
            "type": "`$INTEGER`",
            "active": True,
            "index$": 1,
          },
          {
            "name": "year_string",
            "req": True,
            "type": "`$STRING`",
            "active": True,
            "index$": 2,
          },
        ],
        "name": "year",
        "op": {
          "load": {
            "name": "load",
            "points": [
              {
                "method": "GET",
                "orig": "/year",
                "parts": [
                  "year",
                ],
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "args": {},
                "select": {},
                "index$": 0,
              },
            ],
            "input": "data",
            "key$": "load",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
