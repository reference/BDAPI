/**
 * @class BCContactModel
 * @brief 好友列表模型
 * @author ban
 * @copyright com.kubo 2019
 */

#import <Foundation/Foundation.h>

@interface BCContactModel : NSObject
@property (nonatomic, assign) NSInteger userid;
@property (nonatomic, assign) NSInteger friendid;
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, strong) NSString *friendnickname;
@property (nonatomic, strong) NSString *friendavatar;
@property (nonatomic, strong) NSString *friendremark;
@property (nonatomic, assign) NSInteger from;

+ (void)requestMyContacts:(void(^)(NSArray <BCContactModel *> *ms, NSError *error))completion;

/**
 删除好友
 
 @param friendId <#friendId description#>
 @param completion <#completion description#>
 */
+ (void)deleteFriendById:(NSInteger)friendId completion:(void(^)(NSError *error))completion;
@end
