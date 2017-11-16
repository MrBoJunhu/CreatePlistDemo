//
//  ViewController.m
//  PlistSaveDemo
//
//  Created by BillBo on 2017/11/16.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "ViewController.h"

#import "PlistManager.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *numTextField;
@property (weak, nonatomic) IBOutlet UILabel *testLBL;

@end

@implementation ViewController

- (void)viewDidLoad {
   
    [super viewDidLoad];
    
    self.testLBL.text = [NSString stringWithFormat:@"%ld", [PlistManager sharePlistManager].modelArray.count];
    
}

- (IBAction)saveAction:(id)sender {
    
    if (self.textField.text > 0 && self.numTextField.text.length > 0 ) {
        
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:@{macAddressKey : self.numTextField.text, nameKey : self.textField.text}];

        [[PlistManager sharePlistManager] insertDeviceInfor:dic];

    }
    
    self.testLBL.text = [NSString stringWithFormat:@"%ld", [PlistManager sharePlistManager].modelArray.count];
    
}

@end
