/**
 * @class BCUserModel
 * @brief 用户信息
 * @author ban
 * @copyright com.kubo 2019
 */

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
+ (void)loginWithMobile:(NSString *)mobile password:(NSString *)password completion:(void(^)(BCUserModel *m, NSError *error))completion;

//register
+ (void)registerWithMobile:(NSString *)mobile
                  password:(NSString *)password
                       sex:(NSInteger)sex
                    avatar:(NSString *)avatar
                  nickname:(NSString *)nickname
                      memo:(NSString *)memo
                completion:(void(^)(BCUserModel *m, NSError *error))completion;

//update user info
+ (void)updateUserInfoWithAvatar:(NSString *)avatar nickname:(NSString *)nickname memo:(NSString *)memo sex:(NSString *)sex completion:(void(^)(BCUserModel *m, NSError *error))completion;

/// 用户信息
+ (void)requestUserInfoWithUserId:(NSInteger)userId completion:(void(^)(BCUserModel *m,NSError *error))completion;

/// 搜索用户
+ (void)searchByNickName:(NSString *)nickname completion:(void(^)(BCUserModel *m,NSError *error))completion;
/// 根据用户id搜索
+ (void)searchByUserId:(NSInteger)userId completion:(void(^)(BCUserModel *m,NSError *error))completion;

/// 所有新用户
+ (void)requestNewUsersByOffset:(NSInteger)offset completion:(void(^)(NSArray <BCUserModel*> *ms,NSError *error))completion;

@end
