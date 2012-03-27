//
//  MRPNetwork.h
//  Mis
//
//  Created by 瑞鹏 马 on 12-2-26.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PublicShareDef.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "JSON.h"
#import "ServerAddrDefine.h"
@interface MRPNetwork : NSObject<ASIHTTPRequestDelegate>{
    SEL         action;
    id          delegate;
    //error
    NSString*   errorMessage;
    NSString*   errorDetail;
    BOOL        hasError;
    //用于存储临时信息
    NSDictionary *tempUserInfo;
    //Request
    ASIHTTPRequest *_request;
    ASIFormDataRequest *_dataRequest;
}

//==================================================================================================
@property(nonatomic, assign) BOOL hasError;
@property(nonatomic, copy) NSString* errorMessage;
@property(nonatomic, copy) NSString* errorDetail;
@property(nonatomic, retain) NSDictionary *tempUserInfo;

- (id)initWithTarget:(id)aDelegate action:(SEL)anAction;
- (void)alert;
- (void)stopHttpRequest;


/*
 *@author : 马瑞鹏
 *@date   : 2012-2-28
 *@Desc   : 登录
 */
- (void) login:(NSString *) loginname andPwd:(NSString *) password;

/*
 *@author : 马瑞鹏
 *@date   : 2012-3-3
 *@Desc   : 最新奖金
 */
- (void) getLatestAward:(NSNumber *) customerId;

/*
 *@author : 马瑞鹏
 *@date   : 2012-3-11
 *@Desc   : 历史奖金
 */
- (void) getHistoriyAward:(NSNumber *) customerId;


/*
 *@author : 马瑞鹏
 *@date   : 2012-3-5
 *@Desc   : 级别业绩
 */
- (void) getLevelAchievement:(NSNumber *) customerId;

/*
 *@author : 马瑞鹏
 *@date   : 2012-3-5
 *@Desc   : 升级提醒
 */
- (void) getUpgradeInform:(NSNumber *) customerId;

/*
 *@author : 马瑞鹏
 *@date   : 2012-3-6
 *@Desc   : 添加伙伴时，获得一个新的经销商编号
 */
- (void) getNewFellowNo;

/*
 *@author : 马瑞鹏
 *@date   : 2012-3-6
 *@Desc   : 添加伙伴
 */
- (void) registerNewFellowWithCutomerno:(NSString *)customerNo           
                            andFullname:(NSString *)fullName 
                         andRecommendno:(NSString *) recommendno 
                            andParentno:(NSString *) parentno 
                              andCardno:(NSString *)pid 
                              andShopno:(NSString *) shopno 
                              andRegion:(NSString *) regionNo;

/*
 *@author : 马瑞鹏
 *@date   : 2012-3-8
 *@Desc   : 获取产品种类
 */
- (void) getProductCategory;

/*
 *@author : 马瑞鹏
 *@date   : 2012-3-8
 *@Desc   : 获取账户余额
 */
- (void) getAccountBalance:(NSNumber *) customerId;

/*
 *@author : 马瑞鹏
 *@date   : 2012-3-10
 *@Desc   : 获取奖金账户的余额（供提现申请界面用）
 */
- (void) getBonusAccountBalance:(NSNumber *) customerId;

/*
 *@author : 马瑞鹏
 *@date   : 2012-3-10
 *@Desc   : 提现申请
 */
- (void) outMoneyApplication:(NSNumber *) customerId 
                 andOutMoney:(NSString *) money 
                 andPassword:(NSString *) password;

/*
 *@author : 马瑞鹏
 *@date   : 2012-3-11
 *@Desc   : 转账申请
 */
- (void) transferMoneyApplication:(NSNumber *) customerId 
                  andInCustomerID:(NSString *) inCustomerID
                 andOutMoney:(NSString *) outmoney 
                 andPassword:(NSString *) password;



/*
 *@author : 马瑞鹏
 *@date   : 2012-3-10
 *@Desc   : 获取伙伴列表
 */
- (void) getCompanionList:(NSNumber *) customerId;

/*
 *@author : 马瑞鹏
 *@date   : 2012-3-10
 *@Desc   : 获取指定产品类别的产品清单
 */
- (void) getCategoryDetail:(NSNumber *) categoryid;

/*
 *@author : 马瑞鹏
 *@date   : 2012-3-12
 *@Desc   : 根据订单状态获取订单
 */
- (void) getOrder:(NSNumber *) categoryid andType:(int) orderType;

/*
 *@author : 马瑞鹏
 *@date   : 2012-3-15
 *@Desc   : 获取公告
 */
- (void) getBulletin;

/*
 *@author : 马瑞鹏
 *@date   : 2012-3-15
 *@Desc   : 根据id获取公告
 */
- (void) getBulletinById:(NSNumber *)bulletinID;

/*
 *@author : 马瑞鹏
 *@date   : 2012-3-15
 *@Desc   : 文件下载
 */
- (void) getFileDownloadList;

/*
 *@author : 马瑞鹏
 *@date   : 2012-3-16
 *@Desc   : 发留言
 */
- (void) sendMessage:(NSNumber *) customerId 
            andTitle:(NSString *) title
          andContent:(NSString *) content;

/*
 *@author : 马瑞鹏
 *@date   : 2012-3-16
 *@Desc   : 获取留言
 */
- (void) getMessage:(NSNumber *) customerId andMessageType:(MessageType) type;

/*
 *@author : 马瑞鹏
 *@date   : 2012-3-16
 *@Desc   : 根据id获取留言
 */
- (void) getMessageById:(NSNumber *) msgId;

/*
 *@author : 马瑞鹏
 *@date   : 2012-3-17
 *@Desc   : 获取收货地址
 */
- (void) getDeliverAddr:(NSNumber *) entityId;

/*
 *@author : 马瑞鹏
 *@date   : 2012-3-17
 *@Desc   : 更新收货地址
 */
- (void) updateDeliverAddr:(NSString *) addr 
             andContactMan:(NSString *) contactMan
                andZipCode:(NSString *) zipCode
                 andMobile:(NSString *) mobile
              andContactId:(NSNumber *) contactId;

/*
 *@author : 马瑞鹏
 *@date   : 2012-3-17
 *@Desc   : 获得个人资料
 */
- (void) getPersonalInfo:(NSNumber *) customerId;

/*
 *@author : 马瑞鹏
 *@date   : 2012-3-17
 *@Desc   : 更新个人资料
 */
- (void) updatePersonalInfo:(NSNumber *) customerId 
                andNickName:(NSString *) nickName
                andBirthday:(NSString *) birthday
                     andSex:(NSString *) sex;

/*
 *@author : 马瑞鹏
 *@date   : 2012-3-17
 *@Desc   : 更新一级密码
 */
- (void) updateFirstPwd:(NSNumber *) customerId 
              andOldPwd:(NSString *) oldPwd
              andNewPwd:(NSString *) newPwd;

/*
 *@author : 马瑞鹏
 *@date   : 2012-3-17
 *@Desc   : 更新二级密码
 */
- (void) updateSecondPwd:(NSNumber *) customerId 
               andOldPwd:(NSString *) oldPwd
               andNewPwd:(NSString *) newPwd;


/*
 *@author : 马瑞鹏
 *@date   : 2012-3-19
 *@Desc   : 获取银行列表
 */
- (void) getBankList;

/*
 *@author : 马瑞鹏
 *@date   : 2012-3-19
 *@Desc   : 获取个人银行信息
 */
- (void) getPersonalBankEntity:(NSNumber *) entityid ;

#pragma mark - 更新个人银行信息
/*
 *@author : 马瑞鹏
 *@date   : 2012-3-19
 *@Desc   : 更新个人银行信息
 */
- (void) updatePersonalBankEntity:(NSNumber *) bankid 
                      andBankCode:(NSString *) bankCode
                        andBranch:(NSString *) branch
                   andAccountname:(NSString *) accountname
                     andAccountno:(NSString *) accountno;


/*
 *@author : 马瑞鹏
 *@date   : 2012-3-19
 *@Desc   : 更新个人银行信息
 */
- (void) commitSendMoneyRegistraion:(NSNumber *) customerid 
                        andFullName:(NSString *) fullName
                     andAccountType:(NSNumber *) accountType
                           andMoney:(NSString *) money
                       andRemittime:(NSString *) accountno
                          andMobile:(NSString *) mobile
                        andSerialNo:(NSString *) serialno
                            andMemo:(NSString *) memo;

/*
 *@author : 马瑞鹏
 *@date   : 2012-3-19
 *@Desc   : 根据发货状态获取订单
 */
- (void) getOrderBySendGoodStatus:(NSNumber *)customerId andStatus:(int)flowstatus;

/*
 *@author : 马瑞鹏
 *@date   : 2012-3-19
 *@Desc   : 根据会员 ID 和电子账户类型获 取交易记录
 */
- (void) getTradeRecordByCustomerID:(NSNumber *) customerId
                     andAccountType:(int) accountType;

/*
 *@author : 马瑞鹏
 *@date   : 2012-3-20
 *@Desc   : 更新订单状态
 */
- (void) updateFlowStatus:(NSString *) orderId;

/*
 *@author : 马瑞鹏
 *@date   : 2012-3-20
 *@Desc   : 获取所有订单
 */
- (void) getOrderAll:(NSNumber *) customerId;

/*
 *@author : 马瑞鹏
 *@date   : 2012-3-20
 *@Desc   : 根据类型获取订单
 */
- (void) getOrderByType:(int) type
                andCustomerId:(NSNumber *) customerId;

/*
 *@author : 马瑞鹏
 *@date   : 2012-3-21
 *@Desc   : 获取推荐网络
 */
- (void) getRecommentNetworkWithDepth:(int) depth
          andCustomerId:(NSNumber *) customerId;

/*
 *@author : 马瑞鹏
 *@date   : 2012-3-21
 *@Desc   : 获取安置网络
 */
- (void) getSettleNetworkWithDepth:(int) depth
                        andCustomerId:(NSNumber *) customerId;
@end
