#import "FolderSelectorPlugin.h"
#if __has_include(<folder_selector/folder_selector-Swift.h>)
#import <folder_selector/folder_selector-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "folder_selector-Swift.h"
#endif

@implementation FolderSelectorPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFolderSelectorPlugin registerWithRegistrar:registrar];
}
@end
