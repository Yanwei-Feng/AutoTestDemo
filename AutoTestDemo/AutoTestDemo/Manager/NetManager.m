//
//  NetManager.m
//  AutoTestDemo
//
//  Created by 冯砚伟 on 2020/1/9.
//  Copyright © 2020 冯砚伟. All rights reserved.
//

#import "NetManager.h"

@implementation NetManager
+(instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    static NetManager *netManager = nil;
    dispatch_once(&onceToken, ^{
        netManager = [[NetManager alloc] init];
    });
    return netManager;
}

-(void)request{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];

    NSURL *URL = [NSURL URLWithString:@"http://httpbin.org/get"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];

    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSLog(@"%@ %@", response, responseObject);
        }
    }];
    [dataTask resume];
}

-(void)getGoodsList:(NSString *)keyword success:(SuccessBlock)success failure:(FailureBlock) failure;{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    manager.responseSerializer= [AFHTTPResponseSerializer serializer];
    NSString *url_str = [NSString stringWithFormat:@"http://suggest.taobao.com/sug?code=utf-8&q=%@",keyword];
    NSURL *URL = [NSURL URLWithString:[url_str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:URL];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            if (failure){
                failure(error);
            }
        } else {
            id resp = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
            if (success){
                success(resp);
            }
        }
    }];
    [dataTask resume];
}
@end
