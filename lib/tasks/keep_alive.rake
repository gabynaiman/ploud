require 'net/http'
require 'uri'

def self.http_get url
  begin
    full_url = URI.escape(url)
    print "#{Time.now.strftime("%Y-%m-%d %H:%M:%S")} | Reading #{full_url}"
    response = Net::HTTP.get_response URI.parse(full_url)

    case response
	  when Net::HTTPSuccess, Net::HTTPRedirection
	    puts " | OK"
	  else
	    puts " | Fail"
    end
  rescue Exception => e
    puts " | Fail: #{e.message}"
  end
end

task :keep_alive, :frequence do |t, args|
  args.with_defaults(:frequence => (600))
  loop do
    http_get 'http://ploud.herokuapp.com'
    sleep args.frequence.to_i
  end
end