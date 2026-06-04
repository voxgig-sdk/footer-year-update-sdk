# FooterYearUpdate SDK

Returns the current year as JSON so website footers can stay up to date without manual edits

> TypeScript, Python, PHP, Golang, Ruby, Lua SDKs, a CLI, an interactive REPL, and an MCP server for AI agents — all generated from one OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).

## About Footer Year Update API

The Footer Year Update API is a tiny single-purpose service provided by [GetFullYear](https://getfullyear.com/api). It exists to solve one problem: making sure the copyright year in a website footer stays current without anyone having to remember to bump it in January.

What you get from the API:

- `year` — the current year as an integer
- `year_string` — the current year as a string
- `sponsored_by` — a sponsorship message included with free-tier responses

A single `GET` endpoint at `/year` returns the payload. No authentication is required for basic use. CORS is not enabled by default, so server-side calls (or a proxy) may be needed for direct browser use.

## Try it

**TypeScript**
```bash
npm install footer-year-update
```

**Python**
```bash
pip install footer-year-update-sdk
```

**PHP**
```bash
composer require voxgig/footer-year-update-sdk
```

**Golang**
```bash
go get github.com/voxgig-sdk/footer-year-update-sdk/go
```

**Ruby**
```bash
gem install footer-year-update-sdk
```

**Lua**
```bash
luarocks install footer-year-update-sdk
```

## 30-second quickstart

### TypeScript

```ts
import { FooterYearUpdateSDK } from 'footer-year-update'

const client = new FooterYearUpdateSDK({})

```

See the [TypeScript README](ts/README.md) for the
full guide, or scroll down for the same example in other languages.

## What's in the box

| Surface | Use it for | Path |
| --- | --- | --- |
| **SDK** (TypeScript, Python, PHP, Golang, Ruby, Lua) | App integration | `ts/` `py/` `php/` `go/` `rb/` `lua/` |
| **CLI** | Scripts, CI, ops, one-off API calls | `go-cli/` |
| **MCP server** | AI agents (Claude, Cursor, Cline) | `go-mcp/` |

## Use it from an AI agent (MCP)

The generated MCP server exposes every operation in this SDK as an
[MCP](https://modelcontextprotocol.io) tool that Claude, Cursor or Cline
can call directly. Build and register it:

```bash
cd go-mcp && go build -o footer-year-update-mcp .
```

Then add it to your agent's MCP config (Claude Desktop, Cursor, etc.):

```json
{
  "mcpServers": {
    "footer-year-update": {
      "command": "/abs/path/to/footer-year-update-mcp"
    }
  }
}
```

## Entities

The API exposes one entity:

| Entity | Description | API path |
| --- | --- | --- |
| **Year** | The current calendar year, returned by `GET /year` as a JSON object containing `year`, `year_string`, and `sponsored_by` fields. | `/year` |

Each entity supports the following operations where available: **load**,
**list**, **create**, **update**, and **remove**.

## Quickstart in other languages

### Python

```python
from footeryearupdate_sdk import FooterYearUpdateSDK

client = FooterYearUpdateSDK({})


# Load a specific year
year, err = client.Year(None).load(
    {"id": "example_id"}, None
)
```

### PHP

```php
<?php
require_once 'footeryearupdate_sdk.php';

$client = new FooterYearUpdateSDK([]);


// Load a specific year
[$year, $err] = $client->Year(null)->load(
    ["id" => "example_id"], null
);
```

### Golang

```go
import sdk "github.com/voxgig-sdk/footer-year-update-sdk/go"

client := sdk.NewFooterYearUpdateSDK(map[string]any{})

```

### Ruby

```ruby
require_relative "FooterYearUpdate_sdk"

client = FooterYearUpdateSDK.new({})


# Load a specific year
year, err = client.Year(nil).load(
  { "id" => "example_id" }, nil
)
```

### Lua

```lua
local sdk = require("footer-year-update_sdk")

local client = sdk.new({})


-- Load a specific year
local year, err = client:Year(nil):load(
  { id = "example_id" }, nil
)
```

## Unit testing in offline mode

Every SDK ships a test mode that swaps the HTTP transport for an
in-memory mock, so unit tests run offline.

### TypeScript

```ts
const client = FooterYearUpdateSDK.test()
const result = await client.Year().load({ id: 'test01' })
// result.ok === true, result.data contains mock data
```

### Python

```python
client = FooterYearUpdateSDK.test(None, None)
result, err = client.Year(None).load(
    {"id": "test01"}, None
)
```

### PHP

```php
$client = FooterYearUpdateSDK::test(null, null);
[$result, $err] = $client->Year(null)->load(
    ["id" => "test01"], null
);
```

### Golang

```go
client := sdk.TestSDK(nil, nil)
result, err := client.Year(nil).Load(
    map[string]any{"id": "test01"}, nil,
)
```

### Ruby

```ruby
client = FooterYearUpdateSDK.test(nil, nil)
result, err = client.Year(nil).load(
  { "id" => "test01" }, nil
)
```

### Lua

```lua
local client = sdk.test(nil, nil)
local result, err = client:Year(nil):load(
  { id = "test01" }, nil
)
```

## How it works

Every SDK call runs the same five-stage pipeline:

1. **Point** — resolve the API endpoint from the operation definition.
2. **Spec** — build the HTTP specification (URL, method, headers, body).
3. **Request** — send the HTTP request.
4. **Response** — receive and parse the response.
5. **Result** — extract the result data for the caller.

A feature hook fires at each stage (e.g. `PrePoint`, `PreSpec`,
`PreRequest`), so features can inspect or modify the pipeline without
forking the SDK.

### Features

| Feature | Purpose |
| --- | --- |
| **TestFeature** | In-memory mock transport for testing without a live server |

Pass custom features via the `extend` option at construction time.

### Direct and Prepare

For endpoints the entity model doesn't cover, use the low-level methods:

- **`direct(fetchargs)`** — build and send an HTTP request in one step.
- **`prepare(fetchargs)`** — build the request without sending it.

Both accept a map with `path`, `method`, `params`, `query`,
`headers`, and `body`. See the [How-to guides](#how-to-guides) below.

## How-to guides

### Make a direct API call

When the entity interface does not cover an endpoint, use `direct`:

**TypeScript:**
```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})
console.log(result.data)
```

**Python:**
```python
result, err = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})
```

**PHP:**
```php
[$result, $err] = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);
```

**Go:**
```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
```

**Ruby:**
```ruby
result, err = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})
```

**Lua:**
```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
```

## Per-language documentation

- [TypeScript](ts/README.md)
- [Python](py/README.md)
- [PHP](php/README.md)
- [Golang](go/README.md)
- [Ruby](rb/README.md)
- [Lua](lua/README.md)

## Using the Footer Year Update API

- Upstream: [https://getfullyear.com/api](https://getfullyear.com/api)

---

Generated from the Footer Year Update API OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).
