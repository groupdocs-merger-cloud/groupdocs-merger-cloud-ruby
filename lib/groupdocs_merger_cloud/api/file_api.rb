# -----------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd" file="file.rb">
#   Copyright (c) 2003-2021 Aspose Pty Ltd
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
  class FileApi
    attr_accessor :config

    #make FileApi.new private 
    private_class_method :new

    # Initializes new instance of FileApi
    #
    # @param [config] Configuration 
    # @return [FileApi] New instance of FileApi
    def initialize(config)
      @config = config
      @api_client = ApiClient.new(config)
      @access_token = nil
    end

    # Initializes new instance of FileApi
    #
    # @param [app_sid] Application identifier (App SID)
    # @param [app_key] Application private key (App Key)
    # @return [FileApi] New instance of FileApi
    def self.from_keys(app_sid, app_key)
      config = Configuration.new(app_sid, app_key)
      return new(config)
    end

    # Initializes new instance of FileApi
    #
    # @param [config] Configuration 
    # @return [FileApi] New instance of FileApi
    def self.from_config(config)
      return new(config)
    end

    # Copy file
    # 
    # @param request copy_file_request
    # @return [nil]
    def copy_file(request)
      copy_file_with_http_info(request)
      nil
    end

    # Copy file
    # 
    # @param request copy_file_request
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    def copy_file_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? CopyFileRequest

      @api_client.config.logger.debug 'Calling API: FileApi.copy_file ...' if @api_client.config.debugging
      # verify the required parameter 'src_path' is set
      raise ArgumentError, 'Missing the required parameter src_path when calling FileApi.copy_file' if @api_client.config.client_side_validation && request.src_path.nil?
      # verify the required parameter 'dest_path' is set
      raise ArgumentError, 'Missing the required parameter dest_path when calling FileApi.copy_file' if @api_client.config.client_side_validation && request.dest_path.nil?
      # resource path
      local_var_path = '/merger/storage/file/copy/{srcPath}'
      local_var_path = local_var_path.sub('{' + downcase_first_letter('srcPath') + '}', request.src_path.to_s)

      # query parameters
      query_params = {}
      query_params[downcase_first_letter('destPath')] = request.dest_path

      if local_var_path.include? ('{' + downcase_first_letter('srcStorageName') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('srcStorageName') + '}', request.src_storage_name.to_s)
      else
        query_params[downcase_first_letter('srcStorageName')] = request.src_storage_name unless request.src_storage_name.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('destStorageName') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('destStorageName') + '}', request.dest_storage_name.to_s)
      else
        query_params[downcase_first_letter('destStorageName')] = request.dest_storage_name unless request.dest_storage_name.nil?
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
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        FileApi#copy_file\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Delete file
    # 
    # @param request delete_file_request
    # @return [nil]
    def delete_file(request)
      delete_file_with_http_info(request)
      nil
    end

    # Delete file
    # 
    # @param request delete_file_request
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    def delete_file_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteFileRequest

      @api_client.config.logger.debug 'Calling API: FileApi.delete_file ...' if @api_client.config.debugging
      # verify the required parameter 'path' is set
      raise ArgumentError, 'Missing the required parameter path when calling FileApi.delete_file' if @api_client.config.client_side_validation && request.path.nil?
      # resource path
      local_var_path = '/merger/storage/file/{path}'
      local_var_path = local_var_path.sub('{' + downcase_first_letter('path') + '}', request.path.to_s)

      # query parameters
      query_params = {}
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
      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        FileApi#delete_file\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Download file
    # 
    # @param request download_file_request
    # @return [File]
    def download_file(request)
      data, _status_code, _headers = download_file_with_http_info(request)
      data
    end

    # Download file
    # 
    # @param request download_file_request
    # @return [Array<(File, Fixnum, Hash)>]
    # File data, response status code and response headers
    def download_file_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? DownloadFileRequest

      @api_client.config.logger.debug 'Calling API: FileApi.download_file ...' if @api_client.config.debugging
      # verify the required parameter 'path' is set
      raise ArgumentError, 'Missing the required parameter path when calling FileApi.download_file' if @api_client.config.client_side_validation && request.path.nil?
      # resource path
      local_var_path = '/merger/storage/file/{path}'
      local_var_path = local_var_path.sub('{' + downcase_first_letter('path') + '}', request.path.to_s)

      # query parameters
      query_params = {}
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
      header_params['Accept'] = @api_client.select_header_accept(['multipart/form-data'])
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
                                                        return_type: 'File')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        FileApi#download_file\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Move file
    # 
    # @param request move_file_request
    # @return [nil]
    def move_file(request)
      move_file_with_http_info(request)
      nil
    end

    # Move file
    # 
    # @param request move_file_request
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    def move_file_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? MoveFileRequest

      @api_client.config.logger.debug 'Calling API: FileApi.move_file ...' if @api_client.config.debugging
      # verify the required parameter 'src_path' is set
      raise ArgumentError, 'Missing the required parameter src_path when calling FileApi.move_file' if @api_client.config.client_side_validation && request.src_path.nil?
      # verify the required parameter 'dest_path' is set
      raise ArgumentError, 'Missing the required parameter dest_path when calling FileApi.move_file' if @api_client.config.client_side_validation && request.dest_path.nil?
      # resource path
      local_var_path = '/merger/storage/file/move/{srcPath}'
      local_var_path = local_var_path.sub('{' + downcase_first_letter('srcPath') + '}', request.src_path.to_s)

      # query parameters
      query_params = {}
      query_params[downcase_first_letter('destPath')] = request.dest_path

      if local_var_path.include? ('{' + downcase_first_letter('srcStorageName') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('srcStorageName') + '}', request.src_storage_name.to_s)
      else
        query_params[downcase_first_letter('srcStorageName')] = request.src_storage_name unless request.src_storage_name.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('destStorageName') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('destStorageName') + '}', request.dest_storage_name.to_s)
      else
        query_params[downcase_first_letter('destStorageName')] = request.dest_storage_name unless request.dest_storage_name.nil?
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
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        FileApi#move_file\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Upload file
    # 
    # @param request upload_file_request
    # @return [FilesUploadResult]
    def upload_file(request)
      data, _status_code, _headers = upload_file_with_http_info(request)
      data
    end

    # Upload file
    # 
    # @param request upload_file_request
    # @return [Array<(FilesUploadResult, Fixnum, Hash)>]
    # FilesUploadResult data, response status code and response headers
    def upload_file_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? UploadFileRequest

      @api_client.config.logger.debug 'Calling API: FileApi.upload_file ...' if @api_client.config.debugging
      # verify the required parameter 'path' is set
      raise ArgumentError, 'Missing the required parameter path when calling FileApi.upload_file' if @api_client.config.client_side_validation && request.path.nil?
      # verify the required parameter 'file' is set
      raise ArgumentError, 'Missing the required parameter file when calling FileApi.upload_file' if @api_client.config.client_side_validation && request.file.nil?
      # resource path
      local_var_path = '/merger/storage/file/{path}'
      local_var_path = local_var_path.sub('{' + downcase_first_letter('path') + '}', request.path.to_s)

      # query parameters
      query_params = {}
      if local_var_path.include? ('{' + downcase_first_letter('storageName') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('storageName') + '}', request.storage_name.to_s)
      else
        query_params[downcase_first_letter('storageName')] = request.storage_name unless request.storage_name.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['multipart/form-data'])

      # form parameters
      form_params = {}
      form_params[downcase_first_letter('File')] = request.file

      # http body (model)
      post_body = nil
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'FilesUploadResult')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        FileApi#upload_file\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
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
 # <copyright company="Aspose Pty Ltd" file="copy_file_request.rb">
 #   Copyright (c) 2003-2021 Aspose Pty Ltd
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
  # Request model for copy_file operation.
  #
  class CopyFileRequest

        # Source file path e.g. '/folder/file.ext'
        attr_accessor :src_path
        # Destination file path
        attr_accessor :dest_path
        # Source storage name
        attr_accessor :src_storage_name
        # Destination storage name
        attr_accessor :dest_storage_name
        # File version ID to copy
        attr_accessor :version_id
	
        #
        # Initializes a new instance.
        # @param src_path Source file path e.g. '/folder/file.ext'
        # @param dest_path Destination file path
        # @param src_storage_name Source storage name
        # @param dest_storage_name Destination storage name
        # @param version_id File version ID to copy
        def initialize(src_path, dest_path, src_storage_name = nil, dest_storage_name = nil, version_id = nil)
           self.src_path = src_path
           self.dest_path = dest_path
           self.src_storage_name = src_storage_name
           self.dest_storage_name = dest_storage_name
           self.version_id = version_id
        end
  end
end
 #
 # --------------------------------------------------------------------------------------------------------------------
 # <copyright company="Aspose Pty Ltd" file="delete_file_request.rb">
 #   Copyright (c) 2003-2021 Aspose Pty Ltd
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
  # Request model for delete_file operation.
  #
  class DeleteFileRequest

        # File path e.g. '/folder/file.ext'
        attr_accessor :path
        # Storage name
        attr_accessor :storage_name
        # File version ID to delete
        attr_accessor :version_id
	
        #
        # Initializes a new instance.
        # @param path File path e.g. '/folder/file.ext'
        # @param storage_name Storage name
        # @param version_id File version ID to delete
        def initialize(path, storage_name = nil, version_id = nil)
           self.path = path
           self.storage_name = storage_name
           self.version_id = version_id
        end
  end
end
 #
 # --------------------------------------------------------------------------------------------------------------------
 # <copyright company="Aspose Pty Ltd" file="download_file_request.rb">
 #   Copyright (c) 2003-2021 Aspose Pty Ltd
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
  # Request model for download_file operation.
  #
  class DownloadFileRequest

        # File path e.g. '/folder/file.ext'
        attr_accessor :path
        # Storage name
        attr_accessor :storage_name
        # File version ID to download
        attr_accessor :version_id
	
        #
        # Initializes a new instance.
        # @param path File path e.g. '/folder/file.ext'
        # @param storage_name Storage name
        # @param version_id File version ID to download
        def initialize(path, storage_name = nil, version_id = nil)
           self.path = path
           self.storage_name = storage_name
           self.version_id = version_id
        end
  end
end
 #
 # --------------------------------------------------------------------------------------------------------------------
 # <copyright company="Aspose Pty Ltd" file="move_file_request.rb">
 #   Copyright (c) 2003-2021 Aspose Pty Ltd
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
  # Request model for move_file operation.
  #
  class MoveFileRequest

        # Source file path e.g. '/src.ext'
        attr_accessor :src_path
        # Destination file path e.g. '/dest.ext'
        attr_accessor :dest_path
        # Source storage name
        attr_accessor :src_storage_name
        # Destination storage name
        attr_accessor :dest_storage_name
        # File version ID to move
        attr_accessor :version_id
	
        #
        # Initializes a new instance.
        # @param src_path Source file path e.g. '/src.ext'
        # @param dest_path Destination file path e.g. '/dest.ext'
        # @param src_storage_name Source storage name
        # @param dest_storage_name Destination storage name
        # @param version_id File version ID to move
        def initialize(src_path, dest_path, src_storage_name = nil, dest_storage_name = nil, version_id = nil)
           self.src_path = src_path
           self.dest_path = dest_path
           self.src_storage_name = src_storage_name
           self.dest_storage_name = dest_storage_name
           self.version_id = version_id
        end
  end
end
 #
 # --------------------------------------------------------------------------------------------------------------------
 # <copyright company="Aspose Pty Ltd" file="upload_file_request.rb">
 #   Copyright (c) 2003-2021 Aspose Pty Ltd
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
  # Request model for upload_file operation.
  #
  class UploadFileRequest

        # Path where to upload including filename and extension e.g. /file.ext or /Folder 1/file.ext             If the content is multipart and path does not contains the file name it tries to get them from filename parameter             from Content-Disposition header.             
        attr_accessor :path
        # File to upload
        attr_accessor :file
        # Storage name
        attr_accessor :storage_name
	
        #
        # Initializes a new instance.
        # @param path Path where to upload including filename and extension e.g. /file.ext or /Folder 1/file.ext             If the content is multipart and path does not contains the file name it tries to get them from filename parameter             from Content-Disposition header.             
        # @param file File to upload
        # @param storage_name Storage name
        def initialize(path, file, storage_name = nil)
           self.path = path
           self.file = file
           self.storage_name = storage_name
        end
  end
end
