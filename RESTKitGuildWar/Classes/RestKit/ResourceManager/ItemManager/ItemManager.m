//
//  ItemManager.m
//  RESTKitGuildWar
//
//  Created by Kirill on 11/29/14.
//  Copyright (c) 2014 Kirill Gorbushko. All rights reserved.
//

#import "ItemManager.h"
#import "MappingProvider.h"
#import "ItemRK.h"

@implementation ItemManager

#pragma mark - Public

+ (instancetype)sharedManager
{
    static ItemManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [super sharedManager];
    });
    return sharedManager;
}

- (void)loadItemWithId:(NSInteger)itemId success:(ItemSuccess)success failure:(ItemFailure)failure
{
    NSDictionary *parameters = @{
                                 @"item_id" : @(itemId)
                                 };
    
    [self getObjectsAtPath:kItemsDetailsPathPattern parameters:parameters success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        if (success) {
            ItemRK *requestedItem = (ItemRK *)[mappingResult.array firstObject];
            success(requestedItem);
        }
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(operation, error);
        }
    }];
}

#pragma mark - Private

- (void)setupResponseDescriptor
{
    [super setupResponseDescriptor];
    RKResponseDescriptor *itemDescriptor = [RKResponseDescriptor
                                            responseDescriptorWithMapping:[MappingProvider mappingForItem]
                                            method:RKRequestMethodGET
                                            pathPattern:kItemsDetailsPathPattern
                                            keyPath:nil
                                            statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    [self addResponseDescriptor:itemDescriptor];
}

@end
