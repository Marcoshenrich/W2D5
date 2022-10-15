require_relative "item.rb"

class List
    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description="")
        begin
            item = Item.new(title, deadline, description)
            @items << item
        rescue
            false
        end
    end

    def size
        @items.length
    end

    def valid_index?(index)
        return false if index.to_i < 0 || index.to_i >= size
        true
    end

    def swap(idx1, idx2)
        idx1 = idx1.to_i
        idx2 = idx2.to_i
        unless valid_index?(idx1) && valid_index?(idx2)
            false
        else
            @items[idx1], @items[idx2] = @items[idx2], @items[idx1]  
            true
        end
    end

    def [](idx)
        unless valid_index?(idx.to_i)
            nil
        else
            @items[idx.to_i]
        end
    end

    def priority
        puts @items[0]
    end

    def print
        puts @label.upcase
        puts "----"
        puts "INDEX | ITEM | DUE"
        puts "----"
        @items.each_with_index do |item, i|
            puts i.to_s + " " + item.title  + " " +  item.deadline + " " + item.done.to_s
        end
    end

    def print_full_item(idx)
        unless valid_index?(idx.to_i)
            nil
        else
            item = @items[idx.to_i]
            puts "----"
            puts item.title + " " + item.deadline
            puts item.description  + " " + item.done.to_s
            puts "----"
        end
    end

    def print_priority
        item = priority
        idx = @items.index(item)
        print_full_item(idx)
    end

    def up(idx, amt=1)
        unless valid_index?(idx.to_i)
            false
        else
            moveitem = @items[idx.to_i]
            (amt.to_i).times do
                moveitemidx = @items.index(moveitem)
                return true if moveitemidx == 0
                @items[moveitemidx], @items[moveitemidx - 1] = @items[moveitemidx - 1], @items[moveitemidx]
            end
            true
        end
    end

    def down(idx, amt=1)
        unless valid_index?(idx.to_i)
            false
        else
            moveitem = @items[idx.to_i]
            (amt.to_i).times do
                moveitemidx = @items.index(moveitem)
                return true if moveitemidx == @items.length - 1
                @items[moveitemidx], @items[moveitemidx + 1] = @items[moveitemidx + 1], @items[moveitemidx]
            end
            true
        end
    end

    def sort_by_date!
        @items.sort_by! {|item| item.deadline } 
    end

    def toggle_item(idx)
        @items[idx.to_i].toggle
    end

    def remove_item(idx)
        @items.delete_at(idx.to_i)
    end

    def purge
        resarr = []
        @items.each { |item| resarr << item if item.done == false }
        @items = resarr
    end

end

