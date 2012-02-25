module OpenCongressApi
  module Type
    class Bill
      attr_accessor :bill

      def initialize(bill = {})
        self.bill = bill
      end

      def method_missing(id, *args)
        return self.bill[id.id2name]
      end

      # TODO: Special accessors that need typecasting
    end
  end
end
