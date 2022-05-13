# -----------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd" file="folder.rb">
#   Copyright (c) 2003-2022 Aspose Pty Ltd
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
  class FolderApi
    attr_accessor :config

    #make FolderApi.new private 
    private_class_method :new

    # Initializes new instance of FolderApi
    #
    # @param [config] Configuration 
    # @return [FolderApi] New instance of FolderApi
    def initialize(config)
      @config = config
      @api_client = ApiClient.new(config)
      @access_token = nil
    end

    # Initializes new instance of FolderApi
    #
    # @param [app_sid] Application identifier (App SID)
    # @param [app_key] Application private key (App Key)
    # @return [FolderApi] New instance of FolderApi
    def self.from_keys(app_sid, app_key)
      config = Configuration.new(app_sid, app_key)
      return new(config)
    end

    # Initializes new instance of FolderApi
    #
    # @param [config] Configuration 
    # @return [FolderApi] New instance of FolderApi
    def self.from_config(config)
      return new(config)
    end

    # Copy folder
    # 
    # @param request copy_folder_request
    # @return [nil]
    def copy_folder(request)
      copy_folder_with_http_info(request)
      nil
    end

    # Copy folder
    # 
    # @param request copy_folder_request
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    def copy_folder_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? CopyFolderRequest

      @api_client.config.logger.debug 'Calling API: FolderApi.copy_folder ...' if @api_client.config.debugging
      # verify the required parameter 'src_path' is set
      raise ArgumentError, 'Missing the required parameter src_path when calling FolderApi.copy_folder' if @api_client.config.client_side_validation && request.src_path.nil?
      # verify the required parameter 'dest_path' is set
      raise ArgumentError, 'Missing the required parameter dest_path when calling FolderApi.copy_folder' if @api_client.config.client_side_validation && request.dest_path.nil?
      # resource path
      local_var_path = '/merger/storage/folder/copy/{srcPath}'
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
        FolderApi#copy_folder\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Create the folder
    # 
    # @param request create_folder_request
    # @return [nil]
    def create_folder(request)
      create_folder_with_http_info(request)
      nil
    end

    # Create the folder
    # 
    # @param request create_folder_request
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    def create_folder_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? CreateFolderRequest

      @api_client.config.logger.debug 'Calling API: FolderApi.create_folder ...' if @api_client.config.debugging
      # verify the required parameter 'path' is set
      raise ArgumentError, 'Missing the required parameter path when calling FolderApi.create_folder' if @api_client.config.client_side_validation && request.path.nil?
      # resource path
      local_var_path = '/merger/storage/folder/{path}'
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
        FolderApi#create_folder\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Delete folder
    # 
    # @param request delete_folder_request
    # @return [nil]
    def delete_folder(request)
      delete_folder_with_http_info(request)
      nil
    end

    # Delete folder
    # 
    # @param request delete_folder_request
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    def delete_folder_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteFolderRequest

      @api_client.config.logger.debug 'Calling API: FolderApi.delete_folder ...' if @api_client.config.debugging
      # verify the required parameter 'path' is set
      raise ArgumentError, 'Missing the required parameter path when calling FolderApi.delete_folder' if @api_client.config.client_side_validation && request.path.nil?
      # resource path
      local_var_path = '/merger/storage/folder/{path}'
      local_var_path = local_var_path.sub('{' + downcase_first_letter('path') + '}', request.path.to_s)

      # query parameters
      query_params = {}
      if local_var_path.include? ('{' + downcase_first_letter('storageName') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('storageName') + '}', request.storage_name.to_s)
      else
        query_params[downcase_first_letter('storageName')] = request.storage_name unless request.storage_name.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('recursive') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('recursive') + '}', request.recursive.to_s)
      else
        query_params[downcase_first_letter('recursive')] = request.recursive unless request.recursive.nil?
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
        FolderApi#delete_folder\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Get all files and folders within a folder
    # 
    # @param request get_files_list_request
    # @return [FilesList]
    def get_files_list(request)
      data, _status_code, _headers = get_files_list_with_http_info(request)
      data
    end

    # Get all files and folders within a folder
    # 
    # @param request get_files_list_request
    # @return [Array<(FilesList, Fixnum, Hash)>]
    # FilesList data, response status code and response headers
    def get_files_list_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? GetFilesListRequest

      @api_client.config.logger.debug 'Calling API: FolderApi.get_files_list ...' if @api_client.config.debugging
      # verify the required parameter 'path' is set
      raise ArgumentError, 'Missing the required parameter path when calling FolderApi.get_files_list' if @api_client.config.client_side_validation && request.path.nil?
      # resource path
      local_var_path = '/merger/storage/folder/{path}'
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
                                                        return_type: 'FilesList')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        FolderApi#get_files_list\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Move folder
    # 
    # @param request move_folder_request
    # @return [nil]
    def move_folder(request)
      move_folder_with_http_info(request)
      nil
    end

    # Move folder
    # 
    # @param request move_folder_request
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    def move_folder_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? MoveFolderRequest

      @api_client.config.logger.debug 'Calling API: FolderApi.move_folder ...' if @api_client.config.debugging
      # verify the required parameter 'src_path' is set
      raise ArgumentError, 'Missing the required parameter src_path when calling FolderApi.move_folder' if @api_client.config.client_side_validation && request.src_path.nil?
      # verify the required parameter 'dest_path' is set
      raise ArgumentError, 'Missing the required parameter dest_path when calling FolderApi.move_folder' if @api_client.config.client_side_validation && request.dest_path.nil?
      # resource path
      local_var_path = '/merger/storage/folder/move/{srcPath}'
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
        FolderApi#move_folder\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
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
 # <copyright company="Aspose Pty Ltd" file="copy_folder_request.rb">
 #   Copyright (c) 2003-2022 Aspose Pty Ltd
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
  # Request model for copy_folder operation.
  #
  class CopyFolderRequest

        # Source folder path e.g. '/src'
        attr_accessor :src_path
        # Destination folder path e.g. '/dst'
        attr_accessor :dest_path
        # Source storage name
        attr_accessor :src_storage_name
        # Destination storage name
        attr_accessor :dest_storage_name
	
        #
        # Initializes a new instance.
        # @param src_path Source folder path e.g. '/src'
        # @param dest_path Destination folder path e.g. '/dst'
        # @param src_storage_name Source storage name
        # @param dest_storage_name Destination storage name
        def initialize(src_path, dest_path, src_storage_name = nil, dest_storage_name = nil)
           self.src_path = src_path
           self.dest_path = dest_path
           self.src_storage_name = src_storage_name
           self.dest_storage_name = dest_storage_name
        end
  end
end
 #
 # --------------------------------------------------------------------------------------------------------------------
 # <copyright company="Aspose Pty Ltd" file="create_folder_request.rb">
 #   Copyright (c) 2003-2022 Aspose Pty Ltd
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
  # Request model for create_folder operation.
  #
  class CreateFolderRequest

        # Folder path to create e.g. 'folder_1/folder_2/'
        attr_accessor :path
        # Storage name
        attr_accessor :storage_name
	
        #
        # Initializes a new instance.
        # @param path Folder path to create e.g. 'folder_1/folder_2/'
        # @param storage_name Storage name
        def initialize(path, storage_name = nil)
           self.path = path
           self.storage_name = storage_name
        end
  end
end
 #
 # --------------------------------------------------------------------------------------------------------------------
 # <copyright company="Aspose Pty Ltd" file="delete_folder_request.rb">
 #   Copyright (c) 2003-2022 Aspose Pty Ltd
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
  # Request model for delete_folder operation.
  #
  class DeleteFolderRequest

        # Folder path e.g. '/folder'
        attr_accessor :path
        # Storage name
        attr_accessor :storage_name
        # Enable to delete folders, subfolders and files
        attr_accessor :recursive
	
        #
        # Initializes a new instance.
        # @param path Folder path e.g. '/folder'
        # @param storage_name Storage name
        # @param recursive Enable to delete folders, subfolders and files
        def initialize(path, storage_name = nil, recursive = nil)
           self.path = path
           self.storage_name = storage_name
           self.recursive = recursive
        end
  end
end
 #
 # --------------------------------------------------------------------------------------------------------------------
 # <copyright company="Aspose Pty Ltd" file="get_files_list_request.rb">
 #   Copyright (c) 2003-2022 Aspose Pty Ltd
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
  # Request model for get_files_list operation.
  #
  class GetFilesListRequest

        # Folder path e.g. '/folder'
        attr_accessor :path
        # Storage name
        attr_accessor :storage_name
	
        #
        # Initializes a new instance.
        # @param path Folder path e.g. '/folder'
        # @param storage_name Storage name
        def initialize(path, storage_name = nil)
           self.path = path
           self.storage_name = storage_name
        end
  end
end
 #
 # --------------------------------------------------------------------------------------------------------------------
 # <copyright company="Aspose Pty Ltd" file="move_folder_request.rb">
 #   Copyright (c) 2003-2022 Aspose Pty Ltd
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
  # Request model for move_folder operation.
  #
  class MoveFolderRequest

        # Folder path to move e.g. '/folder'
        attr_accessor :src_path
        # Destination folder path to move to e.g '/dst'
        attr_accessor :dest_path
        # Source storage name
        attr_accessor :src_storage_name
        # Destination storage name
        attr_accessor :dest_storage_name
	
        #
        # Initializes a new instance.
        # @param src_path Folder path to move e.g. '/folder'
        # @param dest_path Destination folder path to move to e.g '/dst'
        # @param src_storage_name Source storage name
        # @param dest_storage_name Destination storage name
        def initialize(src_path, dest_path, src_storage_name = nil, dest_storage_name = nil)
           self.src_path = src_path
           self.dest_path = dest_path
           self.src_storage_name = src_storage_name
           self.dest_storage_name = dest_storage_name
        end
  end
end
