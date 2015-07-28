require "keyword_struct/version"

module KeywordStruct
  def self.new(*args, &block)
    klass = Class.new
    klass.class_eval <<-RUBY
        def initialize(#{args.collect{|a| "#{a}: "}.join(', ')})
    #{args.collect{|a| "@#{a} = #{a}"}.join("\n")}
        end
    RUBY

    args.each do |arg|
      klass.send(:attr_accessor, arg)
    end

    if block_given?
      mod = Module.new(&block)
      klass.prepend(mod)
    end

    return klass
  end
end
