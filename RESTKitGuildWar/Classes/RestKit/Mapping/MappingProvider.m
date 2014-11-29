//
//  MappingProvider.m
//  RESTKitGuildWar
//
//  Created by Kirill on 11/29/14.
//  Copyright (c) 2014 Kirill Gorbushko. All rights reserved.
//

#import "MappingProvider.h"
#import "ItemRK.h"
#import "WeaponRK.h"
#import "InfixUpgradeRK.h"
#import "AttributeRK.h"

@implementation MappingProvider

#pragma mark - Public

+ (RKObjectMapping *)mappingForItem
{
    RKObjectMapping *itemMapping = [RKObjectMapping mappingForClass:[ItemRK class]];
    [itemMapping addAttributeMappingsFromDictionary:@{
                                                          @"item_id" : @"itemID",
                                                          @"name" : @"name",
                                                          @"description" : @"description",
                                                          @"type" : @"type",
                                                          @"level" : @"level",
                                                          @"rarity" : @"rarity",
                                                          @"vendor_value" : @"vendorValue",
                                                          @"icon_file_id" : @"iconFileId",
                                                          @"icon_file_signature" : @"iconFileSignature",
                                                          @"default_skin" : @"defaultScin",
                                                          @"game_types" : @"gameTypes",
                                                          @"flags" : @"flags",
                                                          @"restrictions" : @"restrictions"
                                                      
                                                      }];
    [itemMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"weapon" toKeyPath:@"weapon" withMapping:[MappingProvider mappingForWeapon]]];
    
    return itemMapping;
}

+ (RKObjectMapping *)mappingForWeapon
{
    RKObjectMapping *weaponMapping = [RKObjectMapping mappingForClass:[WeaponRK class]];
    [weaponMapping addAttributeMappingsFromDictionary:@{
                                                        @"type" : @"type",
                                                        @"damage_type" : @"damageType",
                                                        @"min_power" : @"minPowerValue",
                                                        @"max_power" : @"maxPowerValue",
                                                        @"defense" : @"defence",
                                                        @"suffix_item_id" : @"suffixitemId",
                                                        @"secondary_suffix_item_id" : @"secondarySuffixItemId",
                                                        @"infusion_slots" : @"infusionSlots"
                                                        }];
    [weaponMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"infix_upgrade" toKeyPath:@"infixUpgrade" withMapping:[MappingProvider mappingForInfixUpgrade]]];
    
    return weaponMapping;
}

+ (RKObjectMapping *)mappingForInfixUpgrade
{
    RKObjectMapping *infixUpgradeMapping = [RKObjectMapping mappingForClass:[InfixUpgradeRK class]];
    
    [infixUpgradeMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"attributes" toKeyPath:@"attributes" withMapping:[MappingProvider mappingForAttributes]]];
    
    return infixUpgradeMapping;
}

+ (RKObjectMapping *)mappingForAttributes
{
    RKObjectMapping *attributesMapping = [RKObjectMapping mappingForClass:[AttributeRK class]];
    attributesMapping.forceCollectionMapping = YES;
    [attributesMapping addAttributeMappingToKeyOfRepresentationFromAttribute:@"attributesMapping"];
    [attributesMapping addAttributeMappingsFromDictionary:@{
                                                            @"attribute" : @"attributeName",
                                                            @"modifier" : @"modifier"
                                                            }];
    return attributesMapping;
}

@end
