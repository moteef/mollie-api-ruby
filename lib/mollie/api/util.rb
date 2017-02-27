module Mollie
  module API
    module Util
      extend self

      def nested_underscore_keys(obj)
        if obj.is_a?(Hash)
          obj.each_with_object({}) do |(key, value), underscored|
            underscored[underscore(key)] = nested_underscore_keys(value)
          end
        elsif obj.is_a?(Array)
          obj.map { |v| nested_underscore_keys(v) }
        else
          obj
        end
      end

      def camelize_keys(hash)
        hash.each_with_object({}) do |(key, value), camelized|
          camelized[camelize(key)] = value
        end
      end

      def underscore(string)
        string.to_s.gsub(/::/, '/').
          gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2').
          gsub(/([a-z\d])([A-Z])/, '\1_\2').
          tr("-", "_").
          downcase.to_s
      end

      def camelize(term)
        string = term.to_s
        string = string.sub(/^(?:(?=\b|[A-Z_])|\w)/) { |match| match.downcase }
        string.gsub!(/(?:_|(\/))([a-z\d]*)/i) { "#{$1}#{$2.capitalize}" }
        string.gsub!('/'.freeze, '::'.freeze)
        string
      end
    end
  end
end
