/**
 * @class BCContactRequestModel
 * @brief 好友申请列表模型
 * @author ban
 * @copyright com.kubo 2019
 */

#import <Foundation/Foundation.h>
@interface BCContactRequestModel : NSObject
@property (nonatomic, assign) NSInteger userid;
@property (nonatomic, assign) NSInteger fromid;
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString *fromnickname;
@property (nonatomic, strong) NSString *fromavatar;
@property (nonatomic, assign) NSInteger fromsex;
@property (nonatomic, assign) NSInteger agree;
@property (nonatomic, strong) NSString *createdat;
@property (nonatomic, strong) NSString *message;

+ (void)requestMyContactRequests:(void(^)(NSArray <BCContactRequestModel *> *ms, NSError *error))completion;


/**
 同意请求还是拒绝

 @param status 1 同意 2 拒绝
 @param requestUserId 发起请求者的Userid
 @param completion callback
 */
+ (void)agreeOrRefuseStatus:(NSInteger)status requestUserId:(NSInteger)requestUserId completion:(void(^)(NSError *error))completion;


/**
 申请加好友

 @param toUserId <#toUserId description#>
 @param completion <#completion description#>
 */
+ (void)addFriendRequestWithToUserId:(NSInteger)toUserId completion:(void(^)(NSError *error))completion;

@end
