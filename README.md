# GroupDocs.Merger Cloud Ruby SDK
Ruby gem for communicating with the GroupDocs.Merger Cloud API

GroupDocs.Merger Cloud allows you to merge documents and manipulate document structure across wide range of supported document types - PDF, DOCX/DOC, PPTX/PPT, XLSX/XLS, VSDX/VSD, ODT, ODS, ODP, HTML, EPUB and many others. Merge several documents into one, split single document to multiple documents, reorder or replace document pages, change page orientation, manage document password and perform other manipulations with GroupDocs.Merger Cloud API.
## Installation

A gem of groupdocs_merger_cloud is available at [rubygems.org](https://rubygems.org). You can install it with:

```shell
gem install groupdocs_merger_cloud
```    

To add dependency to your app copy following into your Gemfile and run `bundle install`:

```
gem "groupdocs_merger_cloud", "~> 19.10"
```

## Getting Started

Please follow the [installation](#installation) procedure and then run the following code:
```ruby
# Load the gem
require 'groupdocs_merger_cloud'

# Get your app_sid and app_key at https://dashboard.groupdocs.cloud (free registration is required).
app_sid = "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
app_key = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

# Create instance of the API class
api = GroupDocsMergerCloud::InfoApi.from_keys(app_sid, app_key)

# Retrieve supported file-formats
response = api.get_supported_file_formats

# Print out supported file-formats
puts("Supported file-formats:")
response.formats.each do |format|
  puts("#{format.file_format} (#{format.extension})") 
end
```

## Licensing
GroupDocs.Merger Cloud Ruby SDK licensed under [MIT License](LICENSE).

[Home](https://www.groupdocs.cloud/) | [Product Page](https://products.groupdocs.cloud/merger/ruby) | [Docs](https://docs.groupdocs.cloud/merger/) | [Demos](https://products.groupdocs.app/merger/family) | [API Reference](https://apireference.groupdocs.cloud/merger/) | [Examples](https://github.com/groupdocs-merger-cloud/groupdocs-merger-cloud-ruby-samples) | [Blog](https://blog.groupdocs.cloud/category/merger/) | [Free Support](https://forum.groupdocs.cloud/c/merger) | [Free Trial](https://purchase.groupdocs.cloud/trial)
