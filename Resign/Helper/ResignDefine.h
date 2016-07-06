//
//  ResignDefine.h
//  Resign
//
//  Created by apple on 16/7/6.
//  Copyright © 2016年 Francesca Corsini. All rights reserved.
//

typedef void(^SuccessBlock)(id);
typedef void(^ErrorBlock)(NSString*);
typedef void(^LogBlock)(NSString*);

static NSString *kKeyBundleIDChange              = @"keyBundleIDChange";
static NSString *kCFBundleIdentifier             = @"CFBundleIdentifier";
static NSString *kCFBundleDisplayName            = @"CFBundleDisplayName";
static NSString *kCFBundleName                   = @"CFBundleName";
static NSString *kCFBundleShortVersionString     = @"CFBundleShortVersionString";
static NSString *kCFBundleVersion                = @"CFBundleVersion";
static NSString *kCFBundleIcons                  = @"CFBundleIcons";
static NSString *kCFBundlePrimaryIcon            = @"CFBundlePrimaryIcon";
static NSString *kCFBundleIconFiles              = @"CFBundleIconFiles";
static NSString *kCFBundleIconsipad              = @"CFBundleIcons~ipad";
static NSString *kMinimumOSVersion               = @"MinimumOSVersion";
static NSString *kPayloadDirName                 = @"Payload";
static NSString *kInfoPlistFilename              = @"Info.plist";
static NSString *kEntitlementsPlistFilename      = @"Entitlements.plist";
static NSString *kCodeSignatureDirectory         = @"_CodeSignature";
static NSString *kMobileprovisionDirName         = @"Library/MobileDevice/Provisioning Profiles";
static NSString *kEmbeddedProvisioningFilename   = @"embedded";
static NSString *kAppIdentifier                  = @"application-identifier";
static NSString *kTeamIdentifier                 = @"com.apple.developer.team-identifier";
static NSString *kKeychainAccessGroups           = @"keychain-access-groups";
static NSString *kIconNormal                     = @"iconNormal";
static NSString *kIconRetina                     = @"iconRetina";
static NSString *kWKCompanionAppBundleIdentifier = @"WKCompanionAppBundleIdentifier";