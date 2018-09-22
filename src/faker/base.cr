module Faker
  class NonUniqueValue < Exception
  end

  class Base
    macro uniquify_builder(attribute_name)
      @@__unique_vals_for_{{attribute_name}} = Array(String | Int32).new

      def self.unique_{{attribute_name}}(max_retries = 10_0000)
        meth = ->self.{{attribute_name}}

        max_retries.times do |t|
          val = meth.call

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
