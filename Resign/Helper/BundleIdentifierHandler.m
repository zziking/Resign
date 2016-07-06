//
//  BundleIdentifierHandler.m
//  Resign
//
//  Created by kingizz on 16/7/6.
//  Copyright © 2016年 Francesca Corsini. All rights reserved.
//

#import "BundleIdentifierHandler.h"

@interface BundleIdentifierHandler ()

@property (nonatomic, copy) NSString *appPath;

@end

@implementation BundleIdentifierHandler

- (instancetype)initWithAppPath:(NSString *)appPath{
    self = [super init];
    if (self) {
        _appPath = appPath;
    }
    return self;
}

- (void)editInfoPlistWithOriginBundleId:(NSString *)originBundleId
                            newBundleId:(NSString *)newBundleId
                                    Log:(LogBlock)logBlock
                                  error:(ErrorBlock)errorBlock
                                success:(SuccessBlock)successBlock{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDirectoryEnumerator<NSString *> *enumerator = [fileManager enumeratorAtPath:self.appPath];
    for (NSString *file in enumerator) {
        if ([[file componentsSeparatedByString:@"/"].lastObject isEqualToString:@"Info.plist"]) {
            NSLog(@"%@", file);
        }
        
        NSString *infoPlistPath = [self.appPath stringByAppendingPathComponent:file];
        
        // Succeed to find the Info.plist
        if ([[NSFileManager defaultManager] fileExistsAtPath:infoPlistPath])
        {
            if (logBlock){
                logBlock([NSString stringWithFormat:@"Editing the %@ file...", infoPlistPath]);
            }
            
            NSMutableDictionary *plist = [[NSMutableDictionary alloc] initWithContentsOfFile:infoPlistPath];
            NSString *bundleId = [plist objectForKey:kCFBundleIdentifier];
            if (bundleId) {
                bundleId = [bundleId stringByReplacingOccurrencesOfString:originBundleId withString:newBundleId];
                [plist setObject:bundleId forKey:kCFBundleIdentifier];
            }
            
            NSString *wkBundleId = [plist objectForKey:kWKCompanionAppBundleIdentifier];
            if (wkBundleId) {
                wkBundleId = [wkBundleId stringByReplacingOccurrencesOfString:originBundleId withString:newBundleId];
                [plist setObject:wkBundleId forKey:kWKCompanionAppBundleIdentifier];
            }
            
            
            // Save the Info.plist file overwriting
            NSData *xmlData = [NSPropertyListSerialization dataWithPropertyList:plist format:NSPropertyListXMLFormat_v1_0 options:kCFPropertyListImmutable error:nil];
            if ([xmlData writeToFile:infoPlistPath atomically:YES])
            {
                if (successBlock != nil)
                    successBlock(@"File Info.plist edited properly");
            }
            else
            {
                if (errorBlock != nil)
                    errorBlock(@"Failed to re-save the Info.plist file properly. Please try again.");
            }
        }
        
    }
}


@end
