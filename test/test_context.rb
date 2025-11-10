#
# --------------------------------------------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd" file="test_contex.rb">
#    Copyright (c) Aspose Pty Ltd
# </copyright>
# <summary>
#   Permission is hereby granted, free of charge, to any person obtaining a copy
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
    
  require 'openssl'    
    #OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

    require "minitest/autorun"
    require "minitest/unit"

    require_relative './../lib/groupdocs_merger_cloud'
    require_relative './test_settings'
    require_relative './test_file'    

    class TestContext < Minitest::Test

      include MiniTest::Assertions

      @@test_files_uploaded ||= false

      def setup
        config = Configuration.new(TestSettings::APP_SID, TestSettings::APP_KEY)
        config.api_base_url = TestSettings::API_BASE_URL
        #config.debugging = true

        @info_api = InfoApi.from_config(config)
        @document_api = DocumentApi.from_config(config)
        @pages_api = PagesApi.from_config(config)
        @security_api = SecurityApi.from_config(config)
        @storage_api = StorageApi.from_config(config)   
        @folder_api = FolderApi.from_config(config)   
        @file_api = FileApi.from_config(config)   

        @output_path = "output/"
        
        upload_test_files()
      end

      def teardown 
        remove_folder_in_storage @output_path
      end

      def remove_folder_in_storage(folder)
        request = DeleteFolderRequest.new(folder, nil, true)
        @folder_api.delete_folder request
      end

      def upload_test_files
        unless @@test_files_uploaded then
          test_file_path = "test/test_files/"

          TestFile.test_files_list.each do |test_file|

            exist_request = ObjectExistsRequest.new(test_file.path)
            exist_response = @storage_api.object_exists(exist_request)            
            
            if !exist_response.exists then
              @storage_api.config.logger.debug "Uploading: " + test_file.path
              file = File.open(test_file_path + test_file.path, "r")
              upload_request = UploadFileRequest.new test_file.path, file
              @file_api.upload_file(upload_request)
            end
          end
          @@test_files_uploaded = true
        end
      end

    end
end