//
//  WeaponRK.h
//  RESTKitGuildWar
//
//  Created by Kirill on 11/29/14.
//  Copyright (c) 2014 Kirill Gorbushko. All rights reserved.
//

@class InfixUpgradeRK;
@class AttributeRK;

#import <Foundation/Foundation.h>

@interface WeaponRK : NSObject

@property (copy, nonatomic) NSString *type;
@property (copy, nonatomic) NSString *damageType;
@property (assign, nonatomic) NSInteger minPowerValue;
@property (assign, nonatomic) NSInteger maxPowerValue;
@property (assign, nonatomic) NSInteger defence;
@property (strong, nonatomic) NSMutableArray *infusionSlots;
@property (strong, nonatomic) InfixUpgradeRK *infixUpgrade;
@property (assign, nonatomic) NSInteger suffixitemId;
@property (assign, nonatomic) NSInteger secondarySuffixItemId;

@end
