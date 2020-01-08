//
//  YANIndexCtrl.m
//  AutoTestDemo
//
//  Created by 冯砚伟 on 2020/1/2.
//  Copyright © 2020 冯砚伟. All rights reserved.
//

#import "YANIndexCtrl.h"

@interface YANIndexCtrl ()
@property (weak, nonatomic) IBOutlet UIImageView *contentImageView;

@end

@implementation YANIndexCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.contentImageView.image = [UIImage imageNamed:@"fire"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
