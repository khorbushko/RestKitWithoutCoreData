//
//  MappingProvider.h
//  RESTKitGuildWar
//
//  Created by Kirill on 11/29/14.
//  Copyright (c) 2014 Kirill Gorbushko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MappingProvider : NSObject

+ (RKObjectMapping *)mappingForWeapon;
+ (RKObjectMapping *)mappingForItem;
+ (RKObjectMapping *)mappingForInfixUpgrade;
+ (RKObjectMapping *)mappingForAttributes;

@end
