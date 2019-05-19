/**
 * @class BCChatListModel
 * @brief 聊天列表模型
 * @author ban
 * @copyright com.kubo 2019
 */


#import <Foundation/Foundation.h>

@interface BCChatListModel : NSObject
@property (nonatomic, assign) NSInteger userid;
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, assign) NSInteger belonguserid;
@property (nonatomic, assign) NSInteger read;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *useravatar;
@property (nonatomic, strong) NSString *usernickname;


+ (void)requestMyChatLists:(void(^)(NSArray <BCChatListModel *> *ms, NSError *error))completion;

//删除某个人的聊天记录
+ (void)deleteChatListWithFriendId:(NSInteger)friendid completion:(void(^)(NSError *error))completion;

@end
