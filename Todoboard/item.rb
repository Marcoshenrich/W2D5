class Item
    attr_accessor :title, :description
    attr_reader :deadline, :done

    def initialize(title, deadline, description)
        @title = title
        @deadline = deadline
        raise "bad date entry" unless Item.valid_date?(deadline)
        @description = description
        @done = false

    end

    def self.valid_date?(datestr)
        datearr = datestr.split("-")
        year = datearr[0]
        month = datearr[1]
        day = datearr[2]
        return false if day.to_i > 31 || day.length != 2
        return false if month.to_i > 12 || month.length != 2
        return false if year.length != 4
        true
    end

    def deadline=(new_deadline)
        raise "bad date entry" unless Item.valid_date?(new_deadline)
        @deadline=(new_deadline)
    end

    def toggle
        @done = @done == true ? false : true
    end

end


