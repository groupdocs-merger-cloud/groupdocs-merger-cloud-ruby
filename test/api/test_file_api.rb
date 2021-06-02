#
# --------------------------------------------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd">
#    Copyright (c) 2003-2021 Aspose Pty Ltd
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

  class TestFileApi < TestContext
    
    def test_DeleteFile
      test_file = TestFile.four_pages_docx;

      # Delete file
      request = DeleteFileRequest.new test_file.path
      response = @file_api.delete_file(request)

      # Check file not exists
      request = ObjectExistsRequest.new test_file.path
      response = @storage_api.object_exists(request)
      assert_equal false, response.exists

      # Upload file back
      file = File.open("test\\test_files\\" + test_file.path, "r")
      upload_request = UploadFileRequest.new test_file.path, file
      @file_api.upload_file(upload_request)

      # Check file exists
      request = ObjectExistsRequest.new test_file.path
      response = @storage_api.object_exists(request)
      assert_equal true, response.exists      
    end
    
    def test_DownloadFile
      file = TestFile.four_pages_docx;

      request = DownloadFileRequest.new file.path
      response = @file_api.download_file(request)
      assert_operator response.length, :>, 0 
    end

    def test_CopyMoveFile
      file = TestFile.four_pages_docx;

      # Create temp folder
      request = CreateFolderRequest.new "temp"
      response = @folder_api.create_folder(request)

      # Copy file
      destPath = "temp/" + file.file_name
      request = CopyFileRequest.new file.path, destPath
      response = @file_api.copy_file(request)

      # Check copied file
      request = ObjectExistsRequest.new destPath
      response = @storage_api.object_exists(request)
      assert_equal true, response.exists

      # Move file
      new_destPath = "temp/four-pages_1.docx"
      request = MoveFileRequest.new destPath, new_destPath
      response = @file_api.move_file(request)

      # Check moved file
      request = ObjectExistsRequest.new destPath
      response = @storage_api.object_exists(request)
      assert_equal false, response.exists
      request = ObjectExistsRequest.new new_destPath
      response = @storage_api.object_exists(request)
      assert_equal true, response.exists      

      # Delete temp
      request = DeleteFolderRequest.new "temp", nil, true      
      response = @folder_api.delete_folder(request)

    end

  end
end
