# Our HTML form 
# Using the Form DSL

require_relative 'test-dsl'

F = Form.new

F.new_form("First Try") do
    text "Name"
    text "Employer"
    text "Job Title"
    fieldset "Tell us about yourself: " do
        text_area "description", "Description"
        check_box "agree", "I agree to the EULA"
    end
end

