# Ruby Client for the Identity API

A Ruby client for the Identity >= v2 API.

### Installation

Add this line to your application's Gemfile:

```ruby
gem 'identity_crm'
```

And then load it into your application:

```ruby
require 'identity_crm'
```

### Initialising the client

The client is initialised with a user, a token and the url of the Identity server.

```rb
@client = IdentityCRM::Client.new(
  user: ENV["IDENTITY_API_USER"],
  token: ENV["IDENTITY_API_TOKEN"],
  url: 'http://localhost:5000'
)
```

### GET requests

You can get details about one or many resources in the API by calling the
`#get` method.

#### Getting a single resource

To request a single resource, use the `#get` method:

```rb
@client.members.get(member_id)
```

A call to `get` returns an instance of the resource:

```rb
@client.members.get(member_id).first_name
```

Some resources can also be requested with alternative parameters

```rb
@client.members.get(params: { guid: 'abc123' })
```

```rb
@client.members.get(params: { email: 'test@example.com' })
```

### POST requests

Resources are created in the API by calling the `#create` method with the body passed through `params` key.

#### Creating a single resource

```rb
@client.members.create(params: {
  email: 'test@example.com',
  first_name: 'Yoelo',
  last_name: 'Svenslol',
})
```


### Request options

The `options` hash can be passed with options for the request. Currently supported settings are: `timeout`.

```rb
@client.members.get(
  params: { guid: 'abc123' },
  options: { timeout: 0.5 }
)
```
