//
//  GWObjectManager.m
//  RESTKitGuildWar
//
//  Created by Kirill on 11/29/14.
//  Copyright (c) 2014 Kirill Gorbushko. All rights reserved.
//

#import "RKBaseObjectManager.h"

@implementation RKBaseObjectManager

#pragma mark - Public

+ (instancetype)sharedManager
{
    RKBaseObjectManager *sharedManager = [self managerWithBaseURL: [NSURL URLWithString: kBaseApiUrl]];
    sharedManager.requestSerializationMIMEType = RKMIMETypeJSON;
    
    [sharedManager setupRequestDescriptor];
    [sharedManager setupResponseDescriptor];
    
    return sharedManager;
}

- (void)setupRequestDescriptor
{
    
}

- (void)setupResponseDescriptor
{
    
}

@end
