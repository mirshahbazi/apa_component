#import "ApaComponentPlugin.h"
#if __has_include(<apa_component/apa_component-Swift.h>)
#import <apa_component/apa_component-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "apa_component-Swift.h"
#endif

@implementation ApaComponentPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftApaComponentPlugin registerWithRegistrar:registrar];
}
@end
