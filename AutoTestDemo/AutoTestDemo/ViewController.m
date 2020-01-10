//
//  ViewController.m
//  AutoTestDemo
//
//  Created by 冯砚伟 on 2019/12/31.
//  Copyright © 2019 冯砚伟. All rights reserved.
//

#import "ViewController.h"
#import "YANIndexCtrl.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    // Do any additional setup after loading the view.
}
- (IBAction)onClickLoginBtn:(UIButton *)sender {
    if ([self.nameTextField.text isEqualToString:@"15620948172"]&&
        [self.pwdTextField.text isEqualToString:@"123456"]){
        [self presentIndexViewController];
    }else {
        NSLog(@"登录失败");
    }
}

-(void)showLog{
    NSLog(@"52");
}

-(void)showLog1{
    NSLog(@"52");
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

-(void)presentIndexViewController{
    YANIndexCtrl *c = [[YANIndexCtrl alloc] init];
    [self.navigationController pushViewController:c animated:YES];
}
@end
