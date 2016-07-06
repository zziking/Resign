//
//  BundleIdentifierHandler.h
//  Resign
//
//  Created by kingizz on 16/7/6.
//  Copyright © 2016年 Francesca Corsini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResignDefine.h"

@interface BundleIdentifierHandler : NSObject

- (instancetype)initWithAppPath:(NSString *)appPath;

- (void)editInfoPlistWithOriginBundleId:(NSString *)originBundleId
                            newBundleId:(NSString *)newBundleId
                                    Log:(LogBlock)logBlock
                                  error:(ErrorBlock)errorBlock
                                success:(SuccessBlock)successBlock;

@end
