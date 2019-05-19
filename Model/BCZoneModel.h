/**
 * @class BCChatModel
 * @brief 聊天
 * @author ban
 * @copyright com.kubo 2019
 */


#import <Foundation/Foundation.h>

@interface BCZoneModel : NSObject
@property (nonatomic, assign) NSInteger userid;
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *createdat;
@property (nonatomic, assign) NSInteger likes;
@property (nonatomic, assign) double longitude;
@property (nonatomic, assign) double latitude;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *useravatar;
@property (nonatomic, strong) NSString *usernickname;

/// 我朋友圈里的所有说说
+ (void)requestAllMyZoneListWithOffset:(NSInteger)offset completion:(void(^)(NSArray <BCZoneModel *> *ms, NSError *error))completion;

/// 所有用户的说说
+ (void)requestAllZoneListWithOffset:(NSInteger)offset completion:(void(^)(NSArray <BCZoneModel *> *ms, NSError *error))completion;

/// 用户自己朋友圈的说说
+ (void)requestUserZoneListWithUserId:(NSInteger)userId offset:(NSInteger)offset completion:(void(^)(NSArray <BCZoneModel *> *ms, NSError *error))completion;

/// 发朋友圈
+ (void)postNewZoneWithText:(NSString *)text img:(NSString *)img completion:(void(^)(NSError *error))completion;

@end
