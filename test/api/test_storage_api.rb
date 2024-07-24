#
# --------------------------------------------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd">
#    Copyright (c) 2003-2024 Aspose Pty Ltd
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

  require_relative './../test_context'
  require_relative './../test_file'

  class TestStorageApi < TestContext
    
    def test_GetDiscUsage
      request = GetDiscUsageRequest.new
      
      response = @storage_api.get_disc_usage(request)

      assert_operator response.total_size, :>, 0  
      assert_operator response.used_size, :>, 0  
    end

    def test_GetStorageExists
      request = StorageExistsRequest.new "First Storage"

      response = @storage_api.storage_exists(request)

      assert_equal true, response.exists
    end

    def test_GetListFileVersions
      file = TestFile.document_txt;
      request = GetFileVersionsRequest.new file.path

      response = @storage_api.get_file_versions(request)

      assert_operator response.value.size, :>, 0  
    end

    def test_GetObjectExists
      file = TestFile.document_txt;
      request = ObjectExistsRequest.new file.path

      response = @storage_api.object_exists(request)

      assert_equal true, response.exists
      assert_equal false, response.is_folder
    end

  end
end
