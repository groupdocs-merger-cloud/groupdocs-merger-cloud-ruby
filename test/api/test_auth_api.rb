#
# --------------------------------------------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd" file="test_auth_api.rb">
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
  
  require "minitest/autorun"
  require "minitest/unit"

  require_relative './../../lib/groupdocs_merger_cloud'
  require_relative '../test_settings'

  class TestAuthApi < Minitest::Test
    
    def init_info_api(app_sid, app_key)
      config = Configuration.new(app_sid, app_key)
      config.api_base_url = TestSettings::API_BASE_URL
      
      InfoApi.from_config(config)
    end

    # unit tests to check auth error
    def test_auth_error_when_app_sid_not_found
      app_sid = "test"
      app_key = "test"

      info_api = init_info_api(app_sid, app_key)

      error = assert_raises ApiClientError do
        info_api.get_supported_file_formats
      end

      assert_equal "invalid_client", error.message
    end

    # unit tests to check auth error
    def test_auth_error_when_app_key_not_found
      app_sid = TestSettings::APP_SID
      app_key = "test"

      info_api = init_info_api(app_sid, app_key)

      error = assert_raises ApiClientError do
        info_api.get_supported_file_formats
      end

      assert_equal "invalid_client", error.message
    end

  end
end
