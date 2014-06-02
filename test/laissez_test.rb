require 'bundler'
Bundler.require

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
  class Box
    lazy_accessor :width
    lazy_accessor :height
    lazy_accessor :length
  end

  it "returns the return value of calling the block" do
    box = Box.new
    box.width = proc { 1024 }
    box.height = lambda { 576 }
    box.length { 2048 }
    box.width.must_equal 1024
    box.height.must_equal 576
    box.length.must_equal 2048
  end
end



