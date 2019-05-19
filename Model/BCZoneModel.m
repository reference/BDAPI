//
//  BCZoneModel.m
//  BookClub
//
//  Created by 向荣华 on 2019/5/11.
//  Copyright © 2019 scottban. All rights reserved.
//

#import "BCZoneModel.h"
#import <BDToolKit/BDToolKit.h>
#import "HTTP.h"
#import "BDAPI.h"

@implementation BCZoneModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}

+ (void)requestAllMyZoneListWithOffset:(NSInteger)offset completion:(void(^)(NSArray <BCZoneModel *> *ms, NSError *error))completion
{
    NSString *path = @"/api/zone/friends";
    [HTTP requestWithPath:path params:@{@"offset":@(offset),@"size":@(FDPageSize)} responseDataClass:self.class completion:^(HTTPResponse *response, NSError *error) {
        if (completion) {
            completion(response.data,error);
        }
    }];
}

+ (void)requestAllZoneListWithOffset:(NSInteger)offset completion:(void(^)(NSArray <BCZoneModel *> *ms, NSError *error))completion
{
    NSString *path = @"/api/zone/all";
    [HTTP requestWithPath:path params:@{@"offset":@(offset),@"size":@(FDPageSize)} responseDataClass:self.class completion:^(HTTPResponse *response, NSError *error) {
        if (completion) {
            completion(response.data,error);
        }
    }];
}

+ (void)requestUserZoneListWithUserId:(NSInteger)userId offset:(NSInteger)offset completion:(void(^)(NSArray <BCZoneModel *> *ms, NSError *error))completion
{
    NSString *path = @"/api/zone/user";
    [HTTP requestWithPath:path params:@{@"offset":@(offset),@"size":@(FDPageSize),@"userid":@(userId)} responseDataClass:self.class completion:^(HTTPResponse *response, NSError *error) {
        if (completion) {
            completion(response.data,error);
        }
    }];
}

+ (void)postNewZoneWithText:(NSString *)text img:(NSString *)img completion:(void(^)(NSError *error))completion;
{
    NSString *path = @"/api/zone/newPost";
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    if ([text isNotEmpty]) {
        [param setObject:[text stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]] forKey:@"text"];
    }
    if ([img isNotEmpty]) {
        [param setObject:[img stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]] forKey:@"img"];
    }
    [HTTP requestWithPath:path params:param responseDataClass:nil completion:^(HTTPResponse *response, NSError *error) {
        if (completion) {
            completion(error);
        }
    }];
}
@end
