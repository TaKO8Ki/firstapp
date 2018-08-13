require 'redis'
uri = URI.parse('localhost:3000')
REDIS = Redis.new(host: uri.host, port: uri.port)
