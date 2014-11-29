//
//  WeaponManager.h
//  RESTKitGuildWar
//
//  Created by Kirill on 11/29/14.
//  Copyright (c) 2014 Kirill Gorbushko. All rights reserved.
//

@class WeaponRK;

typedef void(^WeaponSuccess)(WeaponRK *weapon);

#import "RKBaseObjectManager.h"

@interface WeaponManager : RKBaseObjectManager

+ (instancetype)sharedManager;

- (void)loadWeaponDetailsForItem:(NSInteger)itemId success:(WeaponSuccess)success failure:(ItemFailure)failure;

@end
