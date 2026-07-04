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
            "active": True,
            "name": "sponsored_by",
            "req": True,
            "type": "`$STRING`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "year",
            "req": True,
            "type": "`$INTEGER`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "year_string",
            "req": True,
            "type": "`$STRING`",
            "index$": 2,
          },
        ],
        "name": "year",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "active": True,
                "args": {},
                "method": "GET",
                "orig": "/year",
                "parts": [
                  "year",
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "load",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
