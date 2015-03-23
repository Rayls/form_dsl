# Simple DSL for TMHT Ruby
# Creates HTML forms

class Form
   @no_content = ''
   
   #Our form constructor
   
    def new_form(title, &block)
       elem("h2", title)
       br
       elem("form", @no_content, id: "form") do
            instance_eval &block if block_given?
        end
    end
    
    #Our form elements
    
    def br
        print "<br />"
    end
    
    def text(text_name)
        print "#{text_name}: "
        elem("input", @no_content, type: "text", name: text_name)
        br
    end
   
    def text_area(text_area_name, text_area_label)
       print "#{text_area_label}: "
       elem("textarea", @no_content, name: text_area_name, form: "form")
       br
    end
   
    def check_box(check_box_name, check_box_label)
       elem("input", @no_content, type: "checkbox", name: check_box_name, value: "yes")
       print " #{check_box_label}"
       br
    end
   
    def fieldset(value, &block)
        elem("fieldset") do
            elem("legend", value)
            br
            instance_eval &block if block_given?
        end
    end
   
   #Our html element constructor
   
   def elem(element_type, content='', hash={}, &block)
       print "<#{element_type} "
       hash.each do |a, b|
           print "#{a}=\"#{b}\" "
       end
       print "> "
       print content 
       yield block if block_given?
       print " </#{element_type}>" unless element_type == "input"
    end
    
end
 
