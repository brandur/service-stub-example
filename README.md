# Service Stub Example

An example app demonstrating service stubs in action for both development and testing environments. Read the full article on [the Heroku API Blog](https://blog.api.heroku.com/development-with-soa).

## Development

```
$ bundle install
$ foreman start
$ curl -X POST http://localhost:5000/endpoints
{"id":123,"cname":"tokyo-1234.herokussl.com","elb_dns_name":"elb016353-1923944129.us-east-1.elb.amazonaws.com"}%
```

## Testing

```
$ bundle install
$ ruby test/web_test.rb
```
