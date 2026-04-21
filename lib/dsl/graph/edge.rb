# frozen_string_literal: true

module Dsl
  module Graph
    class Edge
      attr_reader :id
      attr_accessor :from
      attr_accessor :to
      attr_accessor :label
    
      def initialize(id, from, to, label="")
        @id = id
        @from = from
        @to = to
        @label = label
      end

      def to_s
        @label
      end
    end    
  end
end

