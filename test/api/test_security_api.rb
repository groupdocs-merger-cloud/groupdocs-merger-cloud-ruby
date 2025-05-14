#
# --------------------------------------------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd">
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

  require_relative './../test_context'
  require_relative './../test_settings'
  require_relative './../test_file'

  class TestSecurityApi < TestContext
    
    include MiniTest::Assertions
  
    def test_check_password
      test_file = TestFile.four_pages_docx
      result = @security_api.check_password(CheckPasswordRequest.new(test_file.folder + test_file.file_name))
      assert_equal(false, result.is_password_set) 
    end

    def test_check_password_protected
      test_file = TestFile.password_protected_docx
      result = @security_api.check_password(CheckPasswordRequest.new(test_file.folder + test_file.file_name))
      assert_equal(true, result.is_password_set) 
    end

    def test_remove_password
      test_file = TestFile.password_protected_docx
      options = Options.new
      options.file_info = test_file.file_info
      options.output_path = @output_path + test_file.file_name
      result = @security_api.remove_password(RemovePasswordRequest.new(options))
      assert_equal options.output_path, result.path
    end
 
    def test_add_password
      test_file = TestFile.four_pages_docx
      options = Options.new
      options.file_info = test_file.file_info
      options.file_info.password = "NewPassword"
      options.output_path = @output_path + test_file.file_name
      result = @security_api.add_password(AddPasswordRequest.new(options))
      assert_equal options.output_path, result.path
    end

    def test_update_password
      test_file = TestFile.password_protected_docx
      options = UpdatePasswordOptions.new
      options.file_info = test_file.file_info
      options.output_path = @output_path + test_file.file_name
      options.new_password = "NewPassword"
      result = @security_api.update_password(UpdatePasswordRequest.new(options))
      assert_equal options.output_path, result.path
    end

  end
end
