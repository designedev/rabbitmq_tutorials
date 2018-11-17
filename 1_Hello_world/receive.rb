require 'bunny'

conn = Bunny.new
conn.start

channel = conn.create_channel
queue = channel.queue("hello")
begin
		puts "[*] Waiting for messages.. to exit, press Ctrl + C"
		queue.subscribe(block: true) do |_delievery_indo, _properties, body|
				puts "[X] Reveived message : #{body}"
		end
rescue Interrupt => _
		puts "Error occured"
		connection.close
		exit(0)
end

