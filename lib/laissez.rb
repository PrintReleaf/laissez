require "laissez/version"

class Module
  def lazy_reader(*syms)
    syms.each do |sym|
      raise NameError.new("invalid attribute name: #{sym}") unless sym =~ /^[_A-Za-z]\w*$/
      class_eval(<<-EOS, __FILE__, __LINE__ + 1)
        def #{sym}
          #{sym} = @#{sym}
          #{sym} = #{sym}.call if #{sym}.is_a? Proc
          #{sym}
        end
      EOS
    end
  end

  def lazy_writer(*syms)
    syms.each do |sym|
      raise NameError.new("invalid attribute name: #{sym}") unless sym =~ /^[_A-Za-z]\w*$/
      class_eval(<<-EOS, __FILE__, __LINE__ + 1)
        @#{sym} = nil unless defined? @#{sym}

        def #{sym}=(obj)
          @#{sym} = obj
        end
      EOS
    end
  end

  def lazy_accessor(*syms, &blk)
    lazy_reader(*syms, &blk)
    lazy_writer(*syms, &blk)
  end
end

