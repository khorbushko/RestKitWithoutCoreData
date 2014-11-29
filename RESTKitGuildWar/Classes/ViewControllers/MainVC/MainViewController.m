//
//  MainViewController.m
//  RESTKitGuildWar
//
//  Created by Kirill on 11/29/14.
//  Copyright (c) 2014 Kirill Gorbushko. All rights reserved.
//

#import "MainViewController.h"
#import "ItemManager.h"
#import "ItemRK.h"
#import "WeaponManager.h"
#import "WeaponRK.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self getItem];
}

#pragma mark - Private

- (void)getItem
{
    [[ItemManager sharedManager] loadItemWithId:28446 success:^(ItemRK *item) {
        NSLog(@"%@", item);
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        NSLog(@"Fail to load - %@", error.localizedDescription);
    }];
    
    [[WeaponManager sharedManager] loadWeaponDetailsForItem:28446 success:^(WeaponRK *weapon) {
        NSLog(@"%@", weapon);
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        NSLog(@"error - %@", error.localizedDescription);
    }];
}


@end
