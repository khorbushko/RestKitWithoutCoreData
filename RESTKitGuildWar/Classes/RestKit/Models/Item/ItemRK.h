//
//  ItemRK.h
//  RESTKitGuildWar
//
//  Created by Kirill on 11/29/14.
//  Copyright (c) 2014 Kirill Gorbushko. All rights reserved.
//

@class WeaponRK;

#import <Foundation/Foundation.h>

@interface ItemRK : NSObject

@property (assign, nonatomic) NSInteger itemID;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *description;
@property (copy, nonatomic) NSString *type;
@property (assign, nonatomic) NSInteger level;
@property (copy, nonatomic) NSString *rarity;
@property (assign, nonatomic) NSInteger vendorValue;
@property (assign, nonatomic) NSInteger iconFileId;
@property (copy, nonatomic) NSString *iconFileSignature;
@property (assign, nonatomic) NSInteger defaultScin;
@property (strong, nonatomic) NSMutableArray *gameTypes;
@property (strong, nonatomic) NSMutableArray *flags;
@property (strong, nonatomic) NSMutableArray *restrictions;
@property (strong, nonatomic) WeaponRK *weapon;

@end
