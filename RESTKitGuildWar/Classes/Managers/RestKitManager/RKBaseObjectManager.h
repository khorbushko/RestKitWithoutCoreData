//
//  GWObjectManager.h
//  RESTKitGuildWar
//
//  Created by Kirill on 11/29/14.
//  Copyright (c) 2014 Kirill Gorbushko. All rights reserved.
//

#import "RKObjectManager.h"

typedef void(^ItemFailure)(RKObjectRequestOperation *operation, NSError *error);

@interface RKBaseObjectManager : RKObjectManager

+ (instancetype)sharedManager;

- (void)setupRequestDescriptor;
- (void)setupResponseDescriptor;

@end
