
#import <Foundation/Foundation.h>

@interface AppConfigurationBridge : NSObject

@property(nonnull, copy, readonly) NSString *configurationDescription;
@property(nonnull, copy, readonly) NSString *hostName;
@property(nonnull, copy, readonly) NSString *hostRestName;
@property(nonnull, copy, readonly) NSString *supportEmail;
@property(nonnull, copy, readonly) NSString *appName;
@property(nonnull, copy, readonly) NSString *wssName;

@end
