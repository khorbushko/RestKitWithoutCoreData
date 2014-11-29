//
//  ItemManager.h
//  RESTKitGuildWar
//
//  Created by Kirill on 11/29/14.
//  Copyright (c) 2014 Kirill Gorbushko. All rights reserved.
//

@class ItemRK;

typedef void(^ItemSuccess)(ItemRK *item);

#import "RKBaseObjectManager.h"

@interface ItemManager : RKBaseObjectManager

+ (instancetype)sharedManager;

- (void)loadItemWithId:(NSInteger)itemId success:(ItemSuccess)success failure:(ItemFailure)failure;

@end
