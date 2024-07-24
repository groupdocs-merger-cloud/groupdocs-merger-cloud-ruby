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
  require_relative './../test_settings'
  require_relative './../test_file'

  class TestPagesApi < TestContext
    
    include MiniTest::Assertions
  
    def test_move
      test_file = TestFile.four_pages_docx
      options = MoveOptions.new
      options.file_info = test_file.file_info
      options.output_path = @output_path + test_file.file_name
      options.page_number = 1
      options.new_page_number = 2
      result = @pages_api.move(MoveRequest.new(options))
      assert_equal options.output_path, result.path
    end

    def test_move_protected
      test_file = TestFile.password_protected_docx
      options = MoveOptions.new
      options.file_info = test_file.file_info
      options.output_path = @output_path + test_file.file_name
      options.page_number = 1
      options.new_page_number = 2
      result = @pages_api.move(MoveRequest.new(options))
      assert_equal options.output_path, result.path
    end

    def test_remove
      test_file = TestFile.four_sheets_xlsx
      options = RemoveOptions.new
      options.file_info = test_file.file_info
      options.output_path = @output_path + test_file.file_name
      options.pages = [2, 4]
      result = @pages_api.remove(RemoveRequest.new(options))
      assert_equal options.output_path, result.path
    end

    def test_remove_protected
      test_file = TestFile.four_sheets_protected_xlsx
      options = RemoveOptions.new
      options.file_info = test_file.file_info
      options.output_path = @output_path + test_file.file_name
      options.pages = [2, 4]
      result = @pages_api.remove(RemoveRequest.new(options))
      assert_equal options.output_path, result.path
    end

    def test_rotate
      test_file = TestFile.ten_pages_pdf
      options = RotateOptions.new
      options.file_info = test_file.file_info
      options.output_path = @output_path + test_file.file_name
      options.pages = [2, 4]     
      options.mode = "Rotate90" 
      result = @pages_api.rotate(RotateRequest.new(options))
      assert_equal options.output_path, result.path
    end

    def test_rotate_protected
      test_file = TestFile.one_page_protected_pdf
      options = RotateOptions.new
      options.file_info = test_file.file_info
      options.output_path = @output_path + test_file.file_name
      options.pages = [1]     
      options.mode = "Rotate90" 
      result = @pages_api.rotate(RotateRequest.new(options))
      assert_equal options.output_path, result.path
    end

    def test_swap
      test_file = TestFile.four_pages_docx
      options = SwapOptions.new
      options.file_info = test_file.file_info
      options.output_path = @output_path + test_file.file_name
      options.first_page_number = 2   
      options.second_page_number = 4
      result = @pages_api.swap(SwapRequest.new(options))
      assert_equal options.output_path, result.path
    end

    def test_swap_protected
      test_file = TestFile.password_protected_docx
      options = SwapOptions.new
      options.file_info = test_file.file_info
      options.output_path = @output_path + test_file.file_name
      options.first_page_number = 2   
      options.second_page_number = 4
      result = @pages_api.swap(SwapRequest.new(options))
      assert_equal options.output_path, result.path
    end

    def test_extract
      test_file = TestFile.four_pages_docx
      options = ExtractOptions.new
      options.file_info = test_file.file_info
      options.output_path = @output_path + test_file.file_name
      options.pages = [2, 4]
      result = @pages_api.extract(ExtractRequest.new(options))
      assert_equal options.output_path, result.path
    end
    
    def test_extract_protected
      test_file = TestFile.password_protected_docx
      options = ExtractOptions.new
      options.file_info = test_file.file_info
      options.output_path = @output_path + test_file.file_name
      options.pages = [2, 4]
      result = @pages_api.extract(ExtractRequest.new(options))
      assert_equal options.output_path, result.path
    end

    def test_orientation
      test_file = TestFile.four_pages_docx
      options = OrientationOptions.new
      options.file_info = test_file.file_info
      options.output_path = @output_path + test_file.file_name
      options.pages = [2, 4]
      options.mode = "Landscape"
      result = @pages_api.orientation(OrientationRequest.new(options))
      assert_equal options.output_path, result.path
    end    

    def test_orientation_protected
      test_file = TestFile.password_protected_docx
      options = OrientationOptions.new
      options.file_info = test_file.file_info
      options.output_path = @output_path + test_file.file_name
      options.pages = [2, 4]
      options.mode = "Landscape"
      result = @pages_api.orientation(OrientationRequest.new(options))
      assert_equal options.output_path, result.path
    end

  end
end
