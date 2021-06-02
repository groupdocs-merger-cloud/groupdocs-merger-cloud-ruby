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
  require_relative './../test_settings'
  require_relative './../test_file'

  class TestInfoApi < TestContext
    
    include MiniTest::Assertions

    def test_GetInfoReturnsFileNotFound
      file = TestFile.not_exist;
      request = GetInfoRequest.new(file.file_info)    

      error = assert_raises ApiError do
        @info_api.get_info(request)
      end

      assert_equal "Can't find file located at 'some-folder\\notexist.docx'.", error.message
    end    

    def test_GetInfo
      file = TestFile.password_protected_docx
      request = GetInfoRequest.new(file.file_info)      

      response = @info_api.get_info(request)

      assert_equal 4, response.pages.size      
    end

    def test_get_supported_file_formats
      response = @info_api.get_supported_file_formats
      response.formats.each do |format|
        assert_equal false, format.file_format.empty? 
        assert_equal false, format.extension.empty?
      end
    end    
        
  end
end
