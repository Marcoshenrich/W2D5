require_relative "list.rb" 
require_relative "item.rb" 

class TodoBoard

    def initialize(label)
        @list = nil
        @listhash = {}
    end

    def mklist(label)
        @listhash[label] = List.new(label)
    end

    def ls
        @listhash.keys.each {|label| puts label}
    end

    def showall
        @listhash.each do |listk, listv|
            listv.print
        end
    end

    def listchanger(label)
        @list = @listhash[label]
    end

    def get_command
        puts "put your command"
        ans, *args = gets.chomp.split(" ")
        self.listchanger(args.shift) if @listhash.keys.include?(args[0])

        case ans
        when "showall"
            self.showall
        when "ls"
            self.ls
        when "mklist"
            self.mklist(*args)
        when "purge"
            @list.purge
        when "rm"
            @list.remove_item(*args)
        when "toggle"
            @list.toggle_item(*args)
        when "mktodo"
            @list.add_item(*args)
        when "up"
            @list.up(*args)
        when "down"
            @list.down(*args)
        when "swap"
            @list.swap(*args)
        when "sort"
            @list.sort_by_date!
        when "priority"
            @list.priority
        when "print"
            if args.empty?
                @list.print
            else
                @list.print_full_item(*args)
            end
        when "quit"
            exit
            false
        else
            print "Sorry, that command is not recognized."
        end
    end

    def run
        while true
            self.get_command
        end 
    end

end