//
//  PlistManager.m
//  PlistSaveDemo
//
//  Created by BillBo on 2017/11/16.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "PlistManager.h"

@interface PlistManager()

@property (nonatomic, copy) NSString *plistFilePath;

@end

@implementation PlistManager

+ (instancetype)sharePlistManager {
    
    static PlistManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

- (instancetype)init {
    
    if (self = [super init]) {
        
        NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
        
        NSString *filePath = [path stringByAppendingPathComponent:@"deviceInfor.plist"];
        
        NSLog(@"filePath \n %@", filePath);
        
        self.plistFilePath = filePath;
        
    }
    
    return self;
    
}

- (NSMutableArray *)modelArray {
    
    if (!_modelArray) {
        
        self.modelArray = [NSMutableArray arrayWithContentsOfFile:self.plistFilePath];
        
    }
    
    return _modelArray;
}

- (void)insertDeviceInfor:(NSMutableDictionary *)model {
    
    NSLog(@"%@", model);
    
    NSMutableArray  *arr = [NSMutableArray arrayWithContentsOfFile:self.plistFilePath];
    
    if (arr.count == 0) {
        
        arr = [NSMutableArray array];
        
    }

    __block BOOL isExists = NO;
    
    [arr enumerateObjectsUsingBlock:^(NSMutableDictionary * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([[obj objectForKey:macAddressKey] isEqualToString:[model objectForKey:macAddressKey]]) {
            
            isExists = YES;
            
            [obj setValue:[model objectForKey:nameKey] forKey:nameKey];
            
            *stop = YES;
            
        }
        
    }];
    
    if (!isExists) {
        
        [arr addObject:model];
        
    }
    
    [arr writeToFile:self.plistFilePath atomically:YES];

    self.modelArray = [NSMutableArray arrayWithArray:arr];
    
}

@end
