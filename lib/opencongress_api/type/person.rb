module OpenCongressApi
  module Type
    class Person
      attr_accessor :person

      def initialize(person = {})
        self.person = person
      end

      def method_missing(id, *args)
        return self.person[id.id2name]
      end

      # TODO: Special accessors that need typecasting
    end
  end
end
