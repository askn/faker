module Faker
  class NonUniqueValue < Exception
  end

  class Base
    alias Any = String | Int32 | Float64 | Time

    macro uniquify_builder(attribute_name, *modified_method_attributes)
      @@__unique_vals_for_{{attribute_name}} = Array(Any).new

      def self.unique_{{attribute_name}}({% if !modified_method_attributes.empty? %}{{*modified_method_attributes}},{% end %} max_retries = 10_0000)
        max_retries.times do |t|
          val = self.{{attribute_name}}({{*modified_method_attributes}})

          if !@@__unique_vals_for_{{attribute_name}}.includes?(val)
            @@__unique_vals_for_{{attribute_name}} << val
            return val
          end
        end

        raise NonUniqueValue.new("Unable to generate unique value for {{attribute_name}}")
      end
    end
  end
end
