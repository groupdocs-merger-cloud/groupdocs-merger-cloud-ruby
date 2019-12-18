# ------------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd" file="configuration.rb">
#   Copyright (c) 2003-2019 Aspose Pty Ltd
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
# ------------------------------------------------------------------------------------

module GroupDocsMergerCloud
  #
  # Class for storing API configuration info
  #
  class Configuration
    
    # Api base url, default is 'https://api.groupdocs.cloud'
    #
    # @return [String] Api base url
    attr_accessor :api_base_url

    # Api version, default is '/v1.0'
    #
    # @return [String] Api version
    attr_accessor :api_version

    # Application identifier (App SID)
    #
    # @return [String] Application identifier (App SID)
    attr_accessor :app_sid

    # Application private key (App Key)
    #
    # @return [String] Application private key (App Key)
    attr_accessor :app_key

    # Set this to enable/disable debugging. When enabled (set to true), HTTP request/response
    # details will be logged with `logger.debug` (see the `logger` attribute).
    # Default value is false.
    #
    # @return [true, false]
    attr_accessor :debugging

    # Defines the logger used for debugging.
    # Default to `Rails.logger` (when in Rails) or logging to STDOUT.
    #
    # @return [#logger]
    attr_accessor :logger

    # Defines the temporary folder to store downloaded files
    # (for API endpoints that have file response).
    # System temporary folder is used by default.
    #
    # @return [String]
    attr_accessor :temp_folder_path

    # Set this to false to skip client side validation in the operation.
    # Default to true.
    # @return [true, false]
    attr_accessor :client_side_validation
	
    # Initializes new instance of Configuration
    #
    # @param [app_sid] Application identifier (App SID)
    # @param [app_key] Application private key (App Key)
    # @return [Configuration] New instance of Configuration
    def initialize(app_sid, app_key)
      @api_base_url = "https://api.groupdocs.cloud"
      @api_version = '/v1.0'
      @app_sid = app_sid
      @app_key = app_key
      @client_side_validation = true
      @debugging = false
      @logger = defined?(Rails) ? Rails.logger : Logger.new(STDOUT)

      yield(self) if block_given?
    end

  end
end
