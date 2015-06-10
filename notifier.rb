require 'terminal-notifier'

class Notifier
    @id_file
    
    def initialize file
        @id_file = file
    end
    
    def notify post
        TerminalNotifier.notify("Found a new job listing.\n#{post['title']}", :activate => 'com.google.Chrome', :title => "Reddit Job Finder")
        store post['id']
    end
    
    def store id
        File.open(@id_file, 'a') { |f| f.write("#{id}\n") }
    end
end