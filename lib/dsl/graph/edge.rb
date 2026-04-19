# frozen_string_literal: true

module Dsl
  module Graph
    class Edge
      @@id = 0
    
      attr_reader :id
      attr_accessor :name
    
      def initialize(name)
        @@id += 1
        @id = @@id
        @name = name
      end
    end    
  end
end

