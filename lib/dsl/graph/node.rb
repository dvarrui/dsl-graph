# frozen_string_literal: true

module Dsl
  module Graph
    class Node
      attr_reader :id
      attr_accessor :name
    
      def initialize(id, name)
        @id = id
        @name = name
      end
    end    
  end
end

