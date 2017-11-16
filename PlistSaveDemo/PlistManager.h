//
//  PlistManager.h
//  PlistSaveDemo
//
//  Created by BillBo on 2017/11/16.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *macAddressKey = @"macAddressKey";

static NSString *nameKey = @"nameKey";

@interface PlistManager : NSObject

@property (nonatomic, strong) NSMutableArray *modelArray;


+ (instancetype)sharePlistManager;

- (void)insertDeviceInfor:(NSMutableDictionary *)model;

@end
