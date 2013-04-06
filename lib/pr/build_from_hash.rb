module PR
  class BuildFromHash

    def self.[] form, hash
      new(form).from hash
    end

    def initialize form
      @form = form
    end

    def from hash
      hash.each_pair do |key,value|
        @form.send "#{key}=", value
      end
    end

  end
end
