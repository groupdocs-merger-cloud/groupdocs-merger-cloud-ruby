#
# --------------------------------------------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd">
#    Copyright (c) 2003-2022 Aspose Pty Ltd
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

  class TestFolderApi < TestContext
    
    def test_GetFilesList
      request = GetFilesListRequest.new "Text"

      response = @folder_api.get_files_list(request)

      assert_operator response.value.size, :>, 0
    end
    
    def test_CopyMoveFolder
      # Create temp folder
      request = CreateFolderRequest.new "temp"
      response = @folder_api.create_folder(request)

      # Copy folder
      request = CopyFolderRequest.new "temp", "temp1"
      response = @folder_api.copy_folder(request)

      # Check copied folder
      request = ObjectExistsRequest.new "temp1"
      response = @storage_api.object_exists(request)
      assert_equal true, response.exists
      assert_equal true, response.is_folder

      # Move folder
      request = MoveFolderRequest.new "temp1", "temp2"
      response = @folder_api.move_folder(request)

      # Check moved folder
      request = ObjectExistsRequest.new "temp1"
      response = @storage_api.object_exists(request)
      assert_equal false, response.exists
      request = ObjectExistsRequest.new "temp2"
      response = @storage_api.object_exists(request)
      assert_equal true, response.exists      

      # Delete temp and temp2 folders
      request = DeleteFolderRequest.new "temp", nil, true      
      response = @folder_api.delete_folder(request)
      request = DeleteFolderRequest.new "temp2", nil, true
      response = @folder_api.delete_folder(request)

    end

  end
end
