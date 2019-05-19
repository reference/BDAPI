/**
 MIT License
 
 Copyright (c) 2018 Scott Ban (https://github.com/reference/BDAPI)
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */
/// 用户信息

#import <Foundation/Foundation.h>

@interface BCUserModel : NSObject <NSCoding>
@property (nonatomic, strong) NSString *updatedat;
@property (nonatomic, strong) NSString *albumimage1;
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, strong) NSString *albumimage2;
@property (nonatomic, assign) NSInteger sex;
@property (nonatomic, strong) NSString *mobile;
@property (nonatomic, strong) NSString *realname;
@property (nonatomic, strong) NSString *albumimage3;
@property (nonatomic, strong) NSString *memo;
@property (nonatomic, strong) NSString *avatar;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *token;
@property (nonatomic, strong) NSString *app;
@property (nonatomic, strong) NSString *deviceid;
@property (nonatomic, strong) NSString *platformid;
@property (nonatomic, strong) NSString *createdat;
@property (nonatomic, strong) NSString *client;
@property (nonatomic, strong) NSString *nickname;

- (void)save;

+ (BCUserModel *)user;

+ (void)removeUser;

+ (void)updateUser:(BCUserModel *)user;

+ (BOOL)isLogin;

+ (void)logout;

//login
+ (void)loginWithMobile:(NSString *)mobile password:(NSString *)password forApp:(NSString *)app completion:(void(^)(BCUserModel *m, NSError *error))completion;

//register
+ (void)registerWithMobile:(NSString *)mobile
                  password:(NSString *)password
                       sex:(NSInteger)sex
                    avatar:(NSString *)avatar
                  nickname:(NSString *)nickname
                      memo:(NSString *)memo
                    forApp:(NSString *)app
                completion:(void(^)(BCUserModel *m, NSError *error))completion;

//update user info
+ (void)updateUserInfoWithAvatar:(NSString *)avatar nickname:(NSString *)nickname memo:(NSString *)memo sex:(NSString *)sex forApp:(NSString *)app completion:(void(^)(BCUserModel *m, NSError *error))completion;

/// 用户信息
+ (void)requestUserInfoWithUserId:(NSInteger)userId forApp:(NSString *)app completion:(void(^)(BCUserModel *m,NSError *error))completion;

/// 搜索用户
+ (void)searchByNickName:(NSString *)nickname forApp:(NSString *)app completion:(void(^)(BCUserModel *m,NSError *error))completion;
/// 根据用户id搜索
+ (void)searchByUserId:(NSInteger)userId forApp:(NSString *)app completion:(void(^)(BCUserModel *m,NSError *error))completion;

/// 所有新用户
+ (void)requestNewUsersByOffset:(NSInteger)offset forApp:(NSString *)app completion:(void(^)(NSArray <BCUserModel*> *ms,NSError *error))completion;

@end
