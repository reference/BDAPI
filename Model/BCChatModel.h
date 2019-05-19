/**
 * @class BCChatModel
 * @brief 聊天
 * @author ban
 * @copyright com.kubo 2019
 */


#import <Foundation/Foundation.h>

@interface BCChatModel : NSObject
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, assign) NSInteger belonguserid;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *createdat;
@property (nonatomic, assign) NSInteger senderid;
@property (nonatomic, strong) NSString *senderavatar;
@property (nonatomic, assign) NSInteger receiverid;
@property (nonatomic, strong) NSString *receiveravatar;


+ (void)requestChatsWithFriendUserId:(NSInteger)friendId offset:(NSInteger)offset completion:(void(^)(NSArray <BCChatModel *> *ms, NSError *error))completion;


/**
 发消息

 @param text 文字
 @param img 图片
 @param friendid 朋友id
 @param completion callback
 */
+ (void)sendMessage:(NSString *)text img:(NSString *)img toFriendID:(NSInteger)friendid completion:(void(^)(NSError *error))completion;


/**
 清除与好友的聊天记录

 @param friendid 好友id
 @param completion callback
 */
+ (void)clearChatsWithFriendId:(NSInteger)friendid completion:(void(^)(NSError *error))completion;
@end
