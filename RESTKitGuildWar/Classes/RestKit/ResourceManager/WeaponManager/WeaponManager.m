//
//  WeaponManager.m
//  RESTKitGuildWar
//
//  Created by Kirill on 11/29/14.
//  Copyright (c) 2014 Kirill Gorbushko. All rights reserved.
//

#import "WeaponManager.h"
#import "MappingProvider.h"

@implementation WeaponManager

+ (instancetype)sharedManager
{
    static WeaponManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [super sharedManager];
    });
    return sharedManager;
}

- (void)loadWeaponDetailsForItem:(NSInteger)itemId success:(WeaponSuccess)success failure:(ItemFailure)failure
{
    NSDictionary *parameters = @{
                                 @"item_id" : @(itemId)
                                 };
    
    [self getObjectsAtPath:kItemsDetailsPathPattern parameters:parameters success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        if (success) {
            success ((WeaponRK *)[mappingResult.array firstObject]);
        }
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        if (failure) {
            failure (operation, error);
        }
    }];
}

#pragma mark - Private

- (void)setupResponseDescriptor
{
    [super setupResponseDescriptor];
    [self addResponseDescriptor:[RKResponseDescriptor
                                 responseDescriptorWithMapping:[MappingProvider mappingForWeapon]
                                 method:RKRequestMethodGET
                                 pathPattern:kItemsDetailsPathPattern
                                 keyPath:kWeaponDetailsKeyPath
                                 statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)]];
    
}

@end
