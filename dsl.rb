class Form 
    @no_content = ''
    
    def br
        puts "<br />"
    end
    
    def new_form(title, &block)
       element("h2", title)
       br
       element("form", @no_content, id: "form") do
           element("fieldset") do
                element("legend", "Please Fill Out This Form: ")
                br
                instance_eval &block if block_given?
            end
        end
    end
        
    
    
    def element(name, content='', attribute={}, &block)
        print "< #{name}"
        attribute.each do |a, b|
            print " #{a}=\"#{b}\""
        end
        print ">"
        print content
        yield block if block_given?
        print "</#{name}>" unless name == "input"
    end
    
end