# -----------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd" file="security.rb">
#   Copyright (c) 2003-2023 Aspose Pty Ltd
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
# -----------------------------------------------------------------------------------

require 'uri'
require 'date'

module GroupDocsMergerCloud
  #
  # GroupDocs.Merger Cloud API
  #
  class SecurityApi
    attr_accessor :config

    #make SecurityApi.new private 
    private_class_method :new

    # Initializes new instance of SecurityApi
    #
    # @param [config] Configuration 
    # @return [SecurityApi] New instance of SecurityApi
    def initialize(config)
      @config = config
      @api_client = ApiClient.new(config)
      @access_token = nil
    end

    # Initializes new instance of SecurityApi
    #
    # @param [app_sid] Application identifier (App SID)
    # @param [app_key] Application private key (App Key)
    # @return [SecurityApi] New instance of SecurityApi
    def self.from_keys(app_sid, app_key)
      config = Configuration.new(app_sid, app_key)
      return new(config)
    end

    # Initializes new instance of SecurityApi
    #
    # @param [config] Configuration 
    # @return [SecurityApi] New instance of SecurityApi
    def self.from_config(config)
      return new(config)
    end

    # Add document password protection
    # 
    # @param request add_password_request
    # @return [DocumentResult]
    def add_password(request)
      data, _status_code, _headers = add_password_with_http_info(request)
      data
    end

    # Add document password protection
    # 
    # @param request add_password_request
    # @return [Array<(DocumentResult, Fixnum, Hash)>]
    # DocumentResult data, response status code and response headers
    def add_password_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? AddPasswordRequest

      @api_client.config.logger.debug 'Calling API: SecurityApi.add_password ...' if @api_client.config.debugging
      # verify the required parameter 'options' is set
      raise ArgumentError, 'Missing the required parameter options when calling SecurityApi.add_password' if @api_client.config.client_side_validation && request.options.nil?
      # resource path
      local_var_path = '/merger/password'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.options)
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'DocumentResult')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SecurityApi#add_password\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Checks whether document is password protected
    # 
    # @param request check_password_request
    # @return [PasswordResult]
    def check_password(request)
      data, _status_code, _headers = check_password_with_http_info(request)
      data
    end

    # Checks whether document is password protected
    # 
    # @param request check_password_request
    # @return [Array<(PasswordResult, Fixnum, Hash)>]
    # PasswordResult data, response status code and response headers
    def check_password_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? CheckPasswordRequest

      @api_client.config.logger.debug 'Calling API: SecurityApi.check_password ...' if @api_client.config.debugging
      # verify the required parameter 'file_path' is set
      raise ArgumentError, 'Missing the required parameter file_path when calling SecurityApi.check_password' if @api_client.config.client_side_validation && request.file_path.nil?
      # resource path
      local_var_path = '/merger/password'

      # query parameters
      query_params = {}
      query_params[downcase_first_letter('filePath')] = request.file_path

      if local_var_path.include? ('{' + downcase_first_letter('storageName') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('storageName') + '}', request.storage_name.to_s)
      else
        query_params[downcase_first_letter('storageName')] = request.storage_name unless request.storage_name.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('versionId') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('versionId') + '}', request.version_id.to_s)
      else
        query_params[downcase_first_letter('versionId')] = request.version_id unless request.version_id.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'PasswordResult')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SecurityApi#check_password\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Remove document password protection
    # 
    # @param request remove_password_request
    # @return [DocumentResult]
    def remove_password(request)
      data, _status_code, _headers = remove_password_with_http_info(request)
      data
    end

    # Remove document password protection
    # 
    # @param request remove_password_request
    # @return [Array<(DocumentResult, Fixnum, Hash)>]
    # DocumentResult data, response status code and response headers
    def remove_password_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? RemovePasswordRequest

      @api_client.config.logger.debug 'Calling API: SecurityApi.remove_password ...' if @api_client.config.debugging
      # verify the required parameter 'options' is set
      raise ArgumentError, 'Missing the required parameter options when calling SecurityApi.remove_password' if @api_client.config.client_side_validation && request.options.nil?
      # resource path
      local_var_path = '/merger/password'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.options)
      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'DocumentResult')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SecurityApi#remove_password\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Update document password
    # 
    # @param request update_password_request
    # @return [DocumentResult]
    def update_password(request)
      data, _status_code, _headers = update_password_with_http_info(request)
      data
    end

    # Update document password
    # 
    # @param request update_password_request
    # @return [Array<(DocumentResult, Fixnum, Hash)>]
    # DocumentResult data, response status code and response headers
    def update_password_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? UpdatePasswordRequest

      @api_client.config.logger.debug 'Calling API: SecurityApi.update_password ...' if @api_client.config.debugging
      # verify the required parameter 'options' is set
      raise ArgumentError, 'Missing the required parameter options when calling SecurityApi.update_password' if @api_client.config.client_side_validation && request.options.nil?
      # resource path
      local_var_path = '/merger/password'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.options)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'DocumentResult')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        SecurityApi#update_password\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    #
    # Helper method to convert first letter to downcase
    #
    private def downcase_first_letter(str)
      value = str[0].downcase + str[1..-1]
      value
    end
                 
    #
    # Retrieves access token
    #
    private def get_access_token
        if @access_token.nil? then
          request_access_token
        end
        
        @access_token  
    end

    #
    # Gets a access token from server
    #
    private def request_access_token
        auth_config = Configuration.new(@config.app_sid, @config.app_key)
        auth_config.api_base_url = @config.api_base_url
        auth_config.debugging = @config.debugging
        auth_config.logger = @config.logger
        auth_config.temp_folder_path = @config.temp_folder_path
        auth_config.client_side_validation = @config.client_side_validation
        auth_config.api_version = ''

        auth_api_client = ApiClient.new(auth_config)

        request_url = "/connect/token"
        post_data = "grant_type=client_credentials&client_id=#{@config.app_sid}&client_secret=#{@config.app_key}"

        data, _status_code, _header = auth_api_client.call_api(:POST, request_url, :body => post_data, :return_type => 'Object')
        
        @access_token = data[:access_token]

        expires_in_seconds = data[:expires_in].to_i - 5 * 60 
        expires_in_days = Rational(expires_in_seconds, 60 * 60 * 24)
        @access_token_expires_at = DateTime.now + expires_in_days
    end
    
    # requires all files inside a directory from current dir
    # @param _dir can be relative path like '/lib' or "../lib"
    private def require_all(_dir)
      Dir[File.expand_path(File.join(File.dirname(File.absolute_path(__FILE__)), _dir)) + "/*.rb"].each do |file|
        require file
      end
    end
  end
end
 #
 # --------------------------------------------------------------------------------------------------------------------
 # <copyright company="Aspose Pty Ltd" file="add_password_request.rb">
 #   Copyright (c) 2003-2023 Aspose Pty Ltd
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

module GroupDocsMergerCloud

  #
  # Request model for add_password operation.
  #
  class AddPasswordRequest

        # Options to specify document name and new password
        attr_accessor :options
	
        #
        # Initializes a new instance.
        # @param options Options to specify document name and new password
        def initialize(options)
           self.options = options
        end
  end
end
 #
 # --------------------------------------------------------------------------------------------------------------------
 # <copyright company="Aspose Pty Ltd" file="check_password_request.rb">
 #   Copyright (c) 2003-2023 Aspose Pty Ltd
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

module GroupDocsMergerCloud

  #
  # Request model for check_password operation.
  #
  class CheckPasswordRequest

        # File path
        attr_accessor :file_path
        # Storage name
        attr_accessor :storage_name
        # Version Id
        attr_accessor :version_id
	
        #
        # Initializes a new instance.
        # @param file_path File path
        # @param storage_name Storage name
        # @param version_id Version Id
        def initialize(file_path, storage_name = nil, version_id = nil)
           self.file_path = file_path
           self.storage_name = storage_name
           self.version_id = version_id
        end
  end
end
 #
 # --------------------------------------------------------------------------------------------------------------------
 # <copyright company="Aspose Pty Ltd" file="remove_password_request.rb">
 #   Copyright (c) 2003-2023 Aspose Pty Ltd
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

module GroupDocsMergerCloud

  #
  # Request model for remove_password operation.
  #
  class RemovePasswordRequest

        # Options to specify document name and current password
        attr_accessor :options
	
        #
        # Initializes a new instance.
        # @param options Options to specify document name and current password
        def initialize(options)
           self.options = options
        end
  end
end
 #
 # --------------------------------------------------------------------------------------------------------------------
 # <copyright company="Aspose Pty Ltd" file="update_password_request.rb">
 #   Copyright (c) 2003-2023 Aspose Pty Ltd
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

module GroupDocsMergerCloud

  #
  # Request model for update_password operation.
  #
  class UpdatePasswordRequest

        # Options to specify document name, current and new password
        attr_accessor :options
	
        #
        # Initializes a new instance.
        # @param options Options to specify document name, current and new password
        def initialize(options)
           self.options = options
        end
  end
end
