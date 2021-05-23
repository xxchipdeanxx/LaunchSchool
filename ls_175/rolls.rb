require 'socket'


server = TCPServer.new('localhost',3003)

def parse_request(request_line)
  http_method, path_params, http_ver = request_line.split(" ")
  path, params = path_params.split("?")
  params = params.split("&").each_with_object({}) do |pair, hsh|
    key, value = pair.split("=")
    hsh[key] = value
  end

  [http_method,path,params]
end

loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  puts request_line

  http_method, path, params = parse_request(request_line)

  client.puts "HTTP/1.0 200 OK"
  client.puts "Content-Type: text/html"
  client.puts

  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>"
  client.puts request_line
  client.puts http_method
  client.puts path
  client.puts params
  client.puts "</pre>"

  client.puts "<h1>Rolls!</h1>"
  rolls = params['rolls'].to_i
  sides = params['sides'].to_i

  rolls.times do
    roll = rand(sides) + 1
    client.puts "<p>",roll,"</p>"
  end
  client.puts "</body>"
  client.puts "</html>"

  client.close
end