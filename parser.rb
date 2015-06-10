require 'net/https'
require 'json'
require "awesome_print"

class Parser
    @url
    @posts
    
    def initialize url
        @url = URI.parse url
        res = JSON.parse get_data @url
        @posts = res['data']['children']
    end
    
    def get_data url
        response = Net::HTTP.start(url.host, use_ssl: true) do |http|
            http.get url.request_uri, 'User-Agent' => 'Reddit Job Finder'
        end
        
        case response
        when Net::HTTPRedirection
            puts response['Location']
            get_data response['Location']
        when Net::HTTPSuccess
            response.body
        end

    end
    
    def posts
        posts_to_return = []
        @posts.each do |p|
            if p['data']['title'].downcase.include? "hiring"
                posts_to_return.push('id' => p['data']['id'], 'title' => p['data']['title'], 'url' => p['data']['url'])
            end
        end
            
        posts_to_return
    end
end