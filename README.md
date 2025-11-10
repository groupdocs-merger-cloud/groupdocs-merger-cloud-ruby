# GroupDocs.Merger Cloud Ruby SDK

[GroupDocs.Merger Cloud API](https://products.groupdocs.cloud/merger/ruby/) empowers developers to integrate advanced document merging and page manipulation functionalities into their Ruby applications. Supporting over 40 file formats, this REST API allows seamless merging, splitting, and reorganization of document pages, including PDFs, Word documents, Excel spreadsheets, and more. Security features include password protection for documents, while additional file and folder operations streamline cloud storage management. Whether working with cross-format documents or performing complex page manipulations, GroupDocs.Merger Cloud delivers robust tools for secure and efficient document handling across web, desktop, and mobile platforms.

## Installation

A gem of groupdocs_merger_cloud is available at [rubygems.org](https://rubygems.org). You can install it with:

```shell
gem install groupdocs_merger_cloud
```    

To add dependency to your app copy following into your Gemfile and run `bundle install`:

```
gem "groupdocs_merger_cloud", "~> 25.11"
```

## Getting Started

This example demonstrates merging different Word files seamlessly with a few lines of code:

```ruby
# For complete examples and data files, please go to https://github.com/groupdocs-merger-cloud/groupdocs-merger-cloud-ruby-samples
$app_sid = "XXXX-XXXX-XXXX-XXXX" # Get AppKey and AppSID from https://dashboard.groupdocs.cloud
$app_key = "XXXXXXXXXXXXXXXX" # Get AppKey and AppSID from https://dashboard.groupdocs.cloud
 
documentApi = GroupDocsMergerCloud::DocumentApi.from_keys($app_sid, $app_key)
 
item1 = GroupDocsMergerCloud::JoinItem.new
item1.file_info = GroupDocsMergerCloud::FileInfo.new
item1.file_info.file_path = 'WordProcessing/sample-10-pages.docx'
item1.pages = [3, 6, 8]
 
item2 = GroupDocsMergerCloud::JoinItem.new
item2.file_info = GroupDocsMergerCloud::FileInfo.new
item2.file_info.file_path = 'WordProcessing/four-pages.docx'       
item2.start_page_number = 1
item2.end_page_number = 4
item2.range_mode = "OddPages"
 
options = GroupDocsMergerCloud::JoinOptions.new
options.join_items = [item1, item2]
options.output_path = "Output/joined-pages.docx"
 
result = documentApi.join(GroupDocsMergerCloud::JoinRequest.new(options))
```

## Licensing
GroupDocs.Merger Cloud Ruby SDK licensed under [MIT License](LICENSE).

## Resources
+ [**Website**](https://www.groupdocs.cloud)
+ [**Product Home**](https://products.groupdocs.cloud/merger)
+ [**Documentation**](https://docs.groupdocs.cloud/display/mergercloud/Home)
+ [**Free Support Forum**](https://forum.groupdocs.cloud/c/merger)
+ [**Blog**](https://blog.groupdocs.cloud/category/merger)

## Contact Us
Your feedback is very important to us. Please feel free to contact us using our [Support Forums](https://forum.groupdocs.cloud/c/merger).