require 'rexml/document'

class DataTransformation
  class RecordSelector
    class FieldSelector
      def initialize(options)
        @options = options
      end

      def [](item)
        @options[item]
      end
    end

    attr_accessor :field_selectors

    def initialize(options, &block)
      @options = options;
      @field_selectors = []
      instance_eval &block if block_given?
    end

    def [](item)
      @options[item]
    end

    def field(options)
      @field_selectors << FieldSelector.new(options)
    end
  end

  attr_accessor :record_selectors

  def initialize(mapping)
    @mapping = mapping
    @record_selectors = []
    compile(mapping)
  end

  def compile(code)
    instance_eval(code)
  end

  def record(options, &block)
    @record_selectors << RecordSelector.new(options, &block)
  end

  def transform(data, output)
    doc = REXML::Document.new(data)

    @record_selectors.each do |rs|
      doc.elements.each(rs[:selector]) do |element|
        record = {}
        rs.field_selectors.each do |fs|
          record[fs[:name]] = element.elements[fs[:selector]].text
        end
        output << record
      end
    end
  end
end