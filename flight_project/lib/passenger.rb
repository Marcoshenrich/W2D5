class Passenger
    attr_reader :name

    def initialize(name)
        @flight_numbers = []
        @name = name
    end

    def has_flight?(flightnum)
        @flight_numbers.include?(flightnum.upcase)
    end

    def add_flight(flightnum)
        unless self.has_flight?(flightnum)
            @flight_numbers << flightnum.upcase
        end
    end
end