class MyClass < Object
    
    attr_reader :one, :two, :three
    
    def hello (name)
        puts "Hello, #{@two}"
    end
    
    def test 
        puts "I'm in the function."
        yield "world" if block_given?
    end
    
    def method_missing(method_name, *args, &block)
       puts "omg no method (^_^)" 
    end
    
    
end
