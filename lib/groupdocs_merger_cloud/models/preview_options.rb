 #
 # --------------------------------------------------------------------------------------------------------------------
 # <copyright company="Aspose Pty Ltd" file="preview_options.rb">
 #   Copyright (c) Aspose Pty Ltd
 # </copyright>
 # <summary>
 #  Permission is hereby granted, free of charge, to any person obtaining a copy
 #  of this software and associated documentation files (the "Software"), to deal
 #  in the Software without restriction, including without limitation the rights
 #  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 #  copies of the Software, and to permit persons to whom the Software is
 #  furnished to do so, subject to the following conditions:
 #
 #  The above copyright notice and this permission notice shall be included in all
 #  copies or substantial portions of the Software.
 #
 #  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 #  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 #  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 #  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 #  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 #  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 #  SOFTWARE.
 # </summary>
 # --------------------------------------------------------------------------------------------------------------------
 #

require 'date'

module GroupDocsMergerCloud
  # Represents document preview options
  class PreviewOptions

    # File info
    attr_accessor :file_info

    # The output path.
    attr_accessor :output_path

    # List of page numbers to use in a specific API method. NOTE: page numbering starts from 1.
    attr_accessor :pages

    # Start page number. Ignored if Pages collection is not empty.
    attr_accessor :start_page_number

    # End page number. Ignored if Pages collection is not empty.
    attr_accessor :end_page_number

    # Range mode. Ignored if Pages collection is not empty. Default value is AllPages.
    attr_accessor :range_mode

    # Preview width
    attr_accessor :width

    # Preview height
    attr_accessor :height

    # Preview image format
    attr_accessor :format
    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'file_info' => :'FileInfo',
        :'output_path' => :'OutputPath',
        :'pages' => :'Pages',
        :'start_page_number' => :'StartPageNumber',
        :'end_page_number' => :'EndPageNumber',
        :'range_mode' => :'RangeMode',
        :'width' => :'Width',
        :'height' => :'Height',
        :'format' => :'Format'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'file_info' => :'FileInfo',
        :'output_path' => :'String',
        :'pages' => :'Array<Integer>',
        :'start_page_number' => :'Integer',
        :'end_page_number' => :'Integer',
        :'range_mode' => :'String',
        :'width' => :'Integer',
        :'height' => :'Integer',
        :'format' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.key?(:'FileInfo')
        self.file_info = attributes[:'FileInfo']
      end

      if attributes.key?(:'OutputPath')
        self.output_path = attributes[:'OutputPath']
      end

      if attributes.key?(:'Pages')
        if (value = attributes[:'Pages']).is_a?(Array)
          self.pages = value
        end
      end

      if attributes.key?(:'StartPageNumber')
        self.start_page_number = attributes[:'StartPageNumber']
      end

      if attributes.key?(:'EndPageNumber')
        self.end_page_number = attributes[:'EndPageNumber']
      end

      if attributes.key?(:'RangeMode')
        self.range_mode = attributes[:'RangeMode']
      end

      if attributes.key?(:'Width')
        self.width = attributes[:'Width']
      end

      if attributes.key?(:'Height')
        self.height = attributes[:'Height']
      end

      if attributes.key?(:'Format')
        self.format = attributes[:'Format']
      end

    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properies with the reasons
    def list_invalid_properties
      invalid_properties = []
      if @start_page_number.nil?
        invalid_properties.push("invalid value for 'start_page_number', start_page_number cannot be nil.")
      end

      if @end_page_number.nil?
        invalid_properties.push("invalid value for 'end_page_number', end_page_number cannot be nil.")
      end

      if @range_mode.nil?
        invalid_properties.push("invalid value for 'range_mode', range_mode cannot be nil.")
      end

      if @width.nil?
        invalid_properties.push("invalid value for 'width', width cannot be nil.")
      end

      if @height.nil?
        invalid_properties.push("invalid value for 'height', height cannot be nil.")
      end

      if @format.nil?
        invalid_properties.push("invalid value for 'format', format cannot be nil.")
      end

      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @start_page_number.nil?
      return false if @end_page_number.nil?
      return false if @range_mode.nil?
      range_mode_validator = EnumAttributeValidator.new('String', ["AllPages", "OddPages", "EvenPages"])
      return false unless range_mode_validator.valid?(@range_mode)
      return false if @width.nil?
      return false if @height.nil?
      return false if @format.nil?
      format_validator = EnumAttributeValidator.new('String', ["Jpeg", "Png", "Bmp"])
      return false unless format_validator.valid?(@format)
      return true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] range_mode Object to be assigned
    def range_mode=(range_mode)
      validator = EnumAttributeValidator.new('String', ["AllPages", "OddPages", "EvenPages"])
      if range_mode.to_i == 0
        unless validator.valid?(range_mode)
          raise ArgumentError, "invalid value for 'range_mode', must be one of #{validator.allowable_values}."
        end
        @range_mode = range_mode
      else
        @range_mode = validator.allowable_values[range_mode.to_i]
      end
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] format Object to be assigned
    def format=(format)
      validator = EnumAttributeValidator.new('String', ["Jpeg", "Png", "Bmp"])
      if format.to_i == 0
        unless validator.valid?(format)
          raise ArgumentError, "invalid value for 'format', must be one of #{validator.allowable_values}."
        end
        @format = format
      else
        @format = validator.allowable_values[format.to_i]
      end
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(other)
      return true if self.equal?(other)
      self.class == other.class &&
          file_info == other.file_info &&
          output_path == other.output_path &&
          pages == other.pages &&
          start_page_number == other.start_page_number &&
          end_page_number == other.end_page_number &&
          range_mode == other.range_mode &&
          width == other.width &&
          height == other.height &&
          format == other.format
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(other)
      self == other
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [file_info, output_path, pages, start_page_number, end_page_number, range_mode, width, height, format].hash
    end

    # Downcases first letter.
    # @return downcased string
    def uncap(str)
      str[0, 1].downcase + str[1..-1]
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        pname = uncap(self.class.attribute_map[key]).intern
        value = attributes[pname]
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not                    
          if value.is_a?(Array)
            self.send("#{key}=", value.map { |v| _deserialize($1, v) })
          end
        elsif !value.nil?
          self.send("#{key}=", _deserialize(type, value))
        end
        # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        Date.parse value
      when :Date
        Date.parse value
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else
      # model
        temp_model = GroupDocsMergerCloud.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
