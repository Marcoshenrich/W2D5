class Flight
    attr_reader :passengers

    def initialize(flightnum, capacity)
        @flight_number = flightnum
        @capacity = capacity
        @passengers = []
    end

    def full?
        @passengers.length >= @capacity
    end

    def board_passenger(passenger)
        unless self.full?
            @passengers << passenger if passenger.has_flight?(@flight_number)
        end
    end

    def list_passengers
        resarr = []
        @passengers.each {|pass| resarr << pass.name}
        resarr
    end

    def [](indexnum)
        @passengers[indexnum]
    end

    def <<(passenger)
        self.board_passenger(passenger)
    end
end