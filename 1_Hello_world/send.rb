require 'bunny'

conn = Bunny.new
conn.start

channel = conn.create_channel
queue = channel.queue("hello")
channel.default_exchange.publish("Hello World!", routing_key: queue.name)
puts "[X] Send 'Hello World!'"
conn.close

