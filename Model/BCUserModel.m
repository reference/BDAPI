//
//  BCUserModel.m
//  BookClub
//
//  Created by 向荣华 on 2019/5/2.
//  Copyright © 2019 scottban. All rights reserved.
//

#import "BCUserModel.h"
#import <BDToolKit/BDToolKit.h>
#import "HTTP.h"
#import "BDAPI.h"

#define kUserKey   @"kUserKey"

@implementation BCUserModel

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:@(self.ID) forKey:@"ID"];
    [aCoder encodeObject:self.updatedat forKey:@"updatedat"];
    [aCoder encodeObject:self.albumimage1 forKey:@"albumimage1"];
    [aCoder encodeObject:self.albumimage2 forKey:@"albumimage2"];
    [aCoder encodeObject:self.albumimage3 forKey:@"albumimage3"];
    [aCoder encodeObject:@(self.sex) forKey:@"sex"];
    [aCoder encodeObject:self.mobile forKey:@"mobile"];
    [aCoder encodeObject:self.realname forKey:@"realname"];
    [aCoder encodeObject:self.memo forKey:@"memo"];
    [aCoder encodeObject:self.avatar forKey:@"avatar"];
    [aCoder encodeObject:self.password forKey:@"password"];
    [aCoder encodeObject:self.token forKey:@"token"];
    [aCoder encodeObject:self.app forKey:@"app"];
    [aCoder encodeObject:self.deviceid forKey:@"deviceid"];
    [aCoder encodeObject:self.platformid forKey:@"platformid"];
    [aCoder encodeObject:self.createdat forKey:@"createdat"];
    [aCoder encodeObject:self.client forKey:@"client"];
    [aCoder encodeObject:self.nickname forKey:@"nickname"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.ID = [[aDecoder decodeObjectForKey:@"ID"] integerValue];
        self.updatedat = [aDecoder decodeObjectForKey:@"updatedat"];
        self.albumimage1 = [aDecoder decodeObjectForKey:@"albumimage1"];
        self.albumimage2 = [aDecoder decodeObjectForKey:@"albumimage2"];
        self.albumimage3 = [aDecoder decodeObjectForKey:@"albumimage3"];
        self.sex = [[aDecoder decodeObjectForKey:@"sex"] integerValue];
        self.mobile = [aDecoder decodeObjectForKey:@"mobile"];
        self.realname = [aDecoder decodeObjectForKey:@"realname"];
        self.memo = [aDecoder decodeObjectForKey:@"memo"];
        self.avatar = [aDecoder decodeObjectForKey:@"avatar"];
        self.password = [aDecoder decodeObjectForKey:@"password"];
        self.token = [aDecoder decodeObjectForKey:@"token"];
        self.app = [aDecoder decodeObjectForKey:@"app"];
        self.deviceid = [aDecoder decodeObjectForKey:@"deviceid"];
        self.platformid = [aDecoder decodeObjectForKey:@"platformid"];
        self.createdat = [aDecoder decodeObjectForKey:@"createdat"];
        self.client = [aDecoder decodeObjectForKey:@"client"];
        self.nickname = [aDecoder decodeObjectForKey:@"nickname"];
    }
    return self;
}

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}

- (void)save
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self];
    [ud setObject:data forKey:kUserKey];
    [ud synchronize];
}

+ (id)user
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSData *data = [ud objectForKey:kUserKey];
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}

+ (void)updateUser:(BCUserModel *)user
{
    [self removeUser];
    [user save];
}

+ (void)removeUser
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud removeObjectForKey:kUserKey];
    [ud synchronize];
}

+ (BOOL)isLogin
{
    BCUserModel *user = [self user];
    return user && user.token.length > 0;
}

+ (void)logout
{
    [BCUserModel removeUser];
    [[NSNotificationCenter defaultCenter] postNotificationName:keyUserLogoutNotification object:nil];
}

+ (void)loginWithMobile:(NSString *)mobile password:(NSString *)password completion:(void(^)(BCUserModel *m, NSError *error))completion
{
    NSString *path = @"/api/user/login";
    [HTTP requestWithPath:path params:@{@"mobile":mobile,@"password":password} responseDataClass:self.class completion:^(HTTPResponse *response, NSError *error) {
        if (completion) {
            completion(response.data,error);
        }
    }];
}

+ (void)registerWithMobile:(NSString *)mobile
                  password:(NSString *)password
                       sex:(NSInteger)sex
                    avatar:(NSString *)avatar
                  nickname:(NSString *)nickname
                      memo:(NSString *)memo
                completion:(void(^)(BCUserModel *m, NSError *error))completion
{
    NSString *path = @"/api/user/register";
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setObject:mobile forKey:@"mobile"];
    [param setObject:password forKey:@"password"];
    [param setObject:@(sex) forKey:@"sex"];
    [param setObject:avatar forKey:@"avatar"];
    [param setObject:[nickname stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]] forKey:@"nickname"];
    if ([memo isNotEmpty]) {
        [param setObject:[memo stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]] forKey:@"memo"];
    }
    [param setObject:@"ios" forKey:@"client"];
    [param setObject:@"bookclub" forKey:@"app"];

    [HTTP requestWithPath:path params:param responseDataClass:self.class completion:^(HTTPResponse *response, NSError *error) {
        if (completion) {
            completion(response.data,error);
        }
    }];
}

+ (void)updateUserInfoWithAvatar:(NSString *)avatar nickname:(NSString *)nickname memo:(NSString *)memo sex:(NSString *)sex completion:(void(^)(BCUserModel *m, NSError *error))completion
{
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    if ([avatar isNotEmpty]) {
        [param setObject:avatar forKey:@"avatar"];
    }
    if ([nickname isNotEmpty]) {
        [param setObject:[nickname stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]] forKey:@"nickname"];
    }
    if ([memo isNotEmpty]) {
        [param setObject:[memo stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]] forKey:@"memo"];
    }
    if ([sex isNotEmpty]) {
        [param setObject:sex forKey:@"sex"];
    }
    NSString *path = @"/api/user/updateInfo";

    [HTTP requestWithPath:path params:param responseDataClass:self.class completion:^(HTTPResponse *response, NSError *error) {
        if (completion) {
            completion(response.data,error);
        }
    }];
}

+ (void)requestUserInfoWithUserId:(NSInteger)userId completion:(void(^)(BCUserModel *m,NSError *error))completion
{
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setObject:@(userId) forKey:@"userid"];
    NSString *path = @"/api/user/userInfo";
    
    [HTTP requestWithPath:path params:param responseDataClass:self.class completion:^(HTTPResponse *response, NSError *error) {
        if (completion) {
            completion(response.data,error);
        }
    }];
}

+ (void)searchByNickName:(NSString *)nickname completion:(void(^)(BCUserModel *m,NSError *error))completion
{
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setObject:[nickname stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]] forKey:@"nickname"];
    NSString *path = @"/api/user/search";
    
    [HTTP requestWithPath:path params:param responseDataClass:self.class completion:^(HTTPResponse *response, NSError *error) {
        if (completion) {
            completion(response.data,error);
        }
    }];
}

+ (void)searchByUserId:(NSInteger)userId completion:(void(^)(BCUserModel *m,NSError *error))completion
{
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setObject:@(userId) forKey:@"userId"];
    NSString *path = @"/api/user/search";
    
    [HTTP requestWithPath:path params:param responseDataClass:self.class completion:^(HTTPResponse *response, NSError *error) {
        if (completion) {
            completion(response.data,error);
        }
    }];
}

+ (void)requestNewUsersByOffset:(NSInteger)offset completion:(void(^)(NSArray <BCUserModel*> *ms,NSError *error))completion
{
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setObject:APP forKey:@"app"];
    [param setObject:@(offset) forKey:@"offset"];
    [param setObject:@(FDPageSize) forKey:@"limit"];
    NSString *path = @"/api/user/all";
    
    [HTTP requestWithPath:path params:param responseDataClass:self.class completion:^(HTTPResponse *response, NSError *error) {
        if (completion) {
            completion(response.data,error);
        }
    }];
}
@end
