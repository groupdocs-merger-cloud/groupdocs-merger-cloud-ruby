#
# --------------------------------------------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd">
#    Copyright (c) 2003-2023 Aspose Pty Ltd
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

  class TestDocumentApi < TestContext
    
    include MiniTest::Assertions
  
    def test_split_pages
      test_file = TestFile.four_pages_docx
      options = SplitOptions.new
      options.file_info = test_file.file_info
      options.output_path = @output_path + test_file.file_name
      options.pages = [2, 4]
      options.mode = "Pages"
      result = @document_api.split(SplitRequest.new(options))
      assert_equal 2, result.documents.size
    end
  
    def test_split_pages_protected
      test_file = TestFile.password_protected_docx
      options = SplitOptions.new
      options.file_info = test_file.file_info
      options.output_path = @output_path + test_file.file_name
      options.pages = [2, 4]
      options.mode = "Pages"
      result = @document_api.split(SplitRequest.new(options))
      assert_equal 2, result.documents.size
    end

    def test_preview
      test_file = TestFile.four_pages_docx
      options = PreviewOptions.new
      options.file_info = test_file.file_info
      options.output_path = @output_path + test_file.file_name
      options.pages = [2, 4]
      options.width = 600
      options.height = 900
      options.format = "Png"
      result = @document_api.preview(PreviewRequest.new(options))
      assert_equal 2, result.documents.size
    end
    
    def test_preview_protected
      test_file = TestFile.password_protected_docx
      options = PreviewOptions.new
      options.file_info = test_file.file_info
      options.output_path = @output_path + test_file.file_name
      options.pages = [2, 4]
      options.width = 600
      options.height = 900
      options.format = "Png"
      result = @document_api.preview(PreviewRequest.new(options))
      assert_equal 2, result.documents.size
    end
    
    def test_join
      item1 = JoinItem.new
      item1.file_info = TestFile.password_protected_docx.file_info
      item2 = JoinItem.new
      item2.file_info = TestFile.four_pages_docx.file_info      
      options = JoinOptions.new
      options.join_items = [item1, item2]
      options.output_path = @output_path + "joined.docx"
      result = @document_api.join(JoinRequest.new(options))
      assert_equal(options.output_path, result.path)
    end

    def test_join_cross_format
      item1 = JoinItem.new
      item1.file_info = TestFile.one_page_protected_pdf.file_info
      item2 = JoinItem.new
      item2.file_info = TestFile.four_pages_docx.file_info      
      options = JoinOptions.new
      options.join_items = [item1, item2]
      options.output_path = @output_path + "joined.pdf"
      result = @document_api.join(JoinRequest.new(options))
      assert_equal(options.output_path, result.path)
    end    

    def test_import
      options = ImportOptions.new
      options.file_info = TestFile.one_page_protected_pdf.file_info
      options.attachments = [ TestFile.document_txt.path]
      options.output_path = @output_path + "with-attachment.pdf"
      result = @document_api.import(ImportRequest.new(options))
      assert_equal(options.output_path, result.path)
    end     

  end
end
