require 'rexml/document'

class DataSetBuilder
  class Builder
    attr_accessor :definitions

    def initialize(options, &block)
      @options = options
      @definitions = []
      instance_eval &block if block_given?
    end

    def select(pattern)
      pattern
    end

    def dataset(options)
      @definitions << options
    end

    def [](item)
      @options[item]
    end

    def build()
    end
  end

  attr_accessor :dataset_selectors

  def initialize(code)
    @dataset_selectors = []
    compile(code)
  end

  def compile(code)
    instance_eval(code)
  end

  def build(data, ds)
    doc = REXML::Document.new(data)

    @dataset_selectors.each do |s|
      doc.elements.each(s[:selector]) do |element|
        s.definitions.each do |d|
          ds.data_sets.new(:name => element.elements[d[:name_selector]].to_s)
        end
      end
    end

  end

  def datasets(options, &block)
    @dataset_selectors << Builder.new(options, &block)
  end

end