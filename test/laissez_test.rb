require 'minitest/autorun'
require 'laissez'

describe "lazy_reader" do
  class Image
    lazy_reader :width, :height

    def configure!
      @width = proc { 1024 }
      @height = proc { 576 }
    end
  end

  it "returns the return value of calling the block" do
    image = Image.new
    image.configure!
    image.width.must_equal 1024
    image.height.must_equal 576
  end
end

describe "lazy_accessor" do
  class Rect
    lazy_accessor :width
    lazy_accessor :height
  end

  it "returns the return value of calling the block" do
    rect = Rect.new
    rect.width = proc { 1024 }
    rect.height = lambda { 576 }
    rect.width.must_equal 1024
    rect.height.must_equal 576
  end
end



