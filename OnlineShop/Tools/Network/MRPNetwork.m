//
//  MRPNetwork.m
//  Mis
//
//  Created by 瑞鹏 马 on 12-2-26.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "MRPNetwork.h"

@implementation MRPNetwork

#import "Reachability.h"
#import "JustifyRenturnValue.h"


@synthesize hasError;
@synthesize errorMessage,errorDetail;
@synthesize tempUserInfo;

#pragma mark - init and dealloc 初始化 和 释放
//初始化
- (id)initWithTarget:(id)aDelegate action:(SEL)anAction{
    if ((self = [super init])) {
        action = anAction;
        delegate = aDelegate;
        errorMessage = nil;
        errorDetail = nil;
        hasError = NO;
        tempUserInfo = nil;
        
        _request = nil;
        _dataRequest = nil;
    }
    return self;
}


- (void)dealloc
{
    if (_request) {
        [_request clearDelegatesAndCancel];
        _request = nil;
    }
    if (_dataRequest) {
        [_dataRequest clearDelegatesAndCancel];
        _dataRequest = nil;
    }
    self.tempUserInfo = nil;
    [errorDetail release];
    [errorMessage release];
    [super dealloc];
}


-(void)stopHttpRequest{
    if (_request) {
        [_request clearDelegatesAndCancel];
        _request = nil;
    }
    if (_dataRequest) {
        [_dataRequest clearDelegatesAndCancel];
        _dataRequest = nil;
    }
    [self autorelease];
}

#pragma mark - init and release HttpRequest
//ASIHttpRequest Get
-(void)setHttpRequestGetWithUrl:(NSString *)urlStr{
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    if ([reach isReachable]) {
        NSURL *url = [NSURL URLWithString:urlStr];
        _request = [ASIHTTPRequest requestWithURL:url];
        [_request setTimeOutSeconds:TimeOutSeconds];
        [_request setDelegate:self];
        [_request startAsynchronous];
    }else{
        hasError = YES;
        self.errorDetail = @"当前网络不可用，请检查网络后重试";
        //调用委托
        if ([delegate respondsToSelector:action]) {
            [delegate performSelector:action withObject:self withObject:nil];
        }
    }
}

//ASIHttpRequest Post
-(void)setHttpRequestPostWithUrl:(NSString *)urlStr params:(NSDictionary*)params{
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    if ([reach isReachable]) {
        NSURL *url = [NSURL URLWithString:urlStr];
        //CLog(@"params:%@", params);
        CLog(@"%@",urlStr);
        CLog(@"params is : %@", params );
        _dataRequest = [ASIFormDataRequest requestWithURL:url];
        
        for (NSString *key in [params allKeys]) {
            
            CLog(@"value is : %@ , key is : %@ ", [params objectForKey:key], key );
            
            [_dataRequest setPostValue:[params objectForKey:key] forKey:key];
        }
        
        [_dataRequest setTimeOutSeconds:TimeOutSeconds];
        [_dataRequest setDelegate:self];
        [_dataRequest startAsynchronous];
    }else{
        hasError = YES;
        self.errorDetail = @"当前网络不可用，请检查网络后重试";
        CLog(@"ERROR : %@", self.errorDetail );
        //调用委托
        if ([delegate respondsToSelector:action]) {
            [delegate performSelector:action withObject:self withObject:nil];
        }
    }
}

#pragma mark - ASIHTTPRequestDelegate
- (void)requestFinished:(ASIHTTPRequest *)request
{
    // 当以文本形式读取返回内容时用这个方法
    NSString *responseString = [request responseString];
    CLog(@"%@", responseString);
    NSDictionary *dic = nil;
    if ([[responseString JSONValue] isKindOfClass:[NSDictionary class]]) {
        dic = [responseString JSONValue];
    }
    dic = [responseString JSONValue];    
    CLog(@"requestFinished－－>%@", dic);
    if ([[JustifyRenturnValue sharedInstance] isPostOk:responseString]) {
        //清空错误信息
        hasError = NO;
        self.errorMessage = nil;
        self.errorDetail = nil;
        //调用委托
        if ([delegate respondsToSelector:action]) {
            if ([[responseString JSONValue] isKindOfClass:[NSDictionary class]]) {
                [delegate performSelector:action withObject:self withObject:dic];
            }
            else
            {
                
                [delegate performSelector:action withObject:self withObject:responseString];
            }
            
        }
    }else{
        hasError = YES;
        self.errorMessage = @"服务器异常";
        self.errorDetail = @"服务器返回异常错误";
        
        //--调用委托
        if ([delegate respondsToSelector:action]) {
            [delegate performSelector:action withObject:self withObject:dic];
        }
    }
    _request = nil;
    _dataRequest = nil;
    //释放
    [self autorelease];
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    hasError = YES;
    NSError *error = [request error];
    self.errorMessage = @"连接服务器失败";
    self.errorDetail = [error description];
    //调用委托
    if ([delegate respondsToSelector:action]) {
        [delegate performSelector:action withObject:self withObject:nil];
    }
    _request = nil;
    _dataRequest = nil;
    //释放
    [self autorelease];
}

#pragma mark - alert

-(void)alert{
    if (hasError) {
        CLog(@"errorMessage:%@", errorMessage);
        CLog(@"errorDetail:%@", errorDetail);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:errorDetail delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
}


//==================================================================================================

#pragma mark - 用户接口


#pragma mark - 登录
/*
 *@author : 马瑞鹏
 *@date   : 2012-2-28
 *@Desc   : 登录
 */
-(void) login:(NSString *) loginname andPwd:(NSString *) password
{
    //CLog(@"request URL is : %@", SERVER_ADDRESS );
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           loginname,@"customerno",
                           password,@"password",
                           @"LoginService",@"servicename",
                           @"checkclogin",@"action",
                           
                           nil];
   
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para]; 
}

#pragma mark - 最新奖金
/*
 *@author : 马瑞鹏
 *@date   : 2012-3-3
 *@Desc   : 最新奖金
 */
- (void) getLatestAward:(NSNumber *) customerId
{
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"BonusService",@"servicename",
                           @"getbyid",@"action",
                           customerId,@"customerid",
                           USERNAME,@"username",
                           PRIVATEKEY,@"privatekey",
                           nil];
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para];
}

/*
 *@author : 马瑞鹏
 *@date   : 2012-3-11
 *@Desc   : 历史奖金
 */
- (void) getHistoriyAward:(NSNumber *) customerId
{
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"BonusService",@"servicename",
                           @"bonushistory",@"action",
                           customerId,@"customerid",
                           @"1",@"pageIndex",
                           @"5",@"pageSize",
                           USERNAME,@"username",
                           PRIVATEKEY,@"privatekey",
                           nil];
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para];
}

#pragma mark - 级别业绩
/*
 *@author : 马瑞鹏
 *@date   : 2012-3-5
 *@Desc   : 级别业绩
 */
- (void) getLevelAchievement:(NSNumber *) customerId
{
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"BonusService",@"servicename",
                           @"gradeperformance",@"action",
                           customerId,@"customerid",
                           USERNAME,@"username",
                           PRIVATEKEY,@"privatekey",
                           nil];
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para];
}

#pragma mark - 升级提醒
/*
 *@author : 马瑞鹏
 *@date   : 2012-3-5
 *@Desc   : 升级提醒
 */
- (void) getUpgradeInform:(NSNumber *) customerId
{
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"BonusService",@"servicename",
                           @"upgradenotice",@"action",
                           customerId,@"customerid",
                           USERNAME,@"username",
                           PRIVATEKEY,@"privatekey",
                           nil];
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para];
}

#pragma mark - 获取新经销商id
/*
 *@author : 马瑞鹏
 *@date   : 2012-3-6
 *@Desc   : 添加伙伴时，获得一个新的经销商编号
 */
- (void) getNewFellowNo
{
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"CustomerService",@"servicename",
                           @"getnewno",@"action",
                           USERNAME,@"username",
                           PRIVATEKEY,@"privatekey",
                           nil];
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para];
}

#pragma mark - 添加伙伴
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
                              andRegion:(NSString *) regionNo
{
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           customerNo,@"Customerno",
                           fullName,@"Fullname",
                           recommendno,@"Recommendno",
                           parentno,@"Parentno",
                           pid,@"Cardno",
                           shopno,@"Shopno",
                           regionNo,@"Region",
                           @"CustomerService",@"servicename",
                           @"add",@"action",
                           USERNAME,@"username",
                           PRIVATEKEY,@"privatekey",
                           nil];
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para];
}

#pragma mark - 获取产品种类
/*
 *@author : 马瑞鹏
 *@date   : 2012-3-8
 *@Desc   : 获取产品种类
 */
- (void) getProductCategory
{
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"ProductService",@"servicename",
                           @"getcategory",@"action",
                           USERNAME,@"username",
                           PRIVATEKEY,@"privatekey",
                           nil];
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para];
}

#pragma mark - 获取账户余额
/*
 *@author : 马瑞鹏
 *@date   : 2012-3-8
 *@Desc   : 获取账户余额
 */
- (void) getAccountBalance:(NSNumber *) customerId
{
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"WalletService",@"servicename",
                           @"getwalletall",@"action",
                           customerId,@"customerid",
                           USERNAME,@"username",
                           PRIVATEKEY,@"privatekey",
                           nil];
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para];
}

#pragma mark - 获取奖金账户的余额（供提现申请界面用）
/*
 *@author : 马瑞鹏
 *@date   : 2012-3-10
 *@Desc   : 获取奖金账户的余额（供提现申请界面用）
 */
- (void) getBonusAccountBalance:(NSNumber *) customerId
{
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"WalletService",@"servicename",
                           @"getwalletbalance",@"action",
                           customerId,@"customerid",
                           @"1",@"accounttype",
                           USERNAME,@"username",
                           PRIVATEKEY,@"privatekey",
                           nil];
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para];
}

#pragma mark - 提现申请
/*
 *@author : 马瑞鹏
 *@date   : 2012-3-10
 *@Desc   : 提现申请
 */
- (void) outMoneyApplication:(NSNumber *) customerId 
                 andOutMoney:(NSString *) money 
                 andPassword:(NSString *) password
{
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"Constants.Services.WALLET_SERVICE",@"servicename",
                           @"walletwithdrawadd",@"action",
                           customerId,@"customerid",
                           money,@"outmoney",
                           password,@"password",
                           @"1",@"accounttype",
                           USERNAME,@"username",
                           PRIVATEKEY,@"privatekey",
                           nil];
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para];
}

#pragma mark - 转账申请
/*
 *@author : 马瑞鹏
 *@date   : 2012-3-11
 *@Desc   : 转账申请
 */
- (void) transferMoneyApplication:(NSNumber *) customerId 
                  andInCustomerID:(NSString *) inCustomerID
                      andOutMoney:(NSString *) outmoney 
                      andPassword:(NSString *) password
{
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"Constants.Services.WALLET_SERVICE",@"servicename",
                           @"wallettransapplyadd",@"action",
                           customerId,@"customerid",
                           inCustomerID,@"incustomerno",
                           outmoney,@"outmoney",
                           password,@"password",
                           @"1",@"accounttype",
                           USERNAME,@"username",
                           PRIVATEKEY,@"privatekey",
                           nil];
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para];
}

#pragma mark - 获取伙伴列表
/*
 *@author : 马瑞鹏
 *@date   : 2012-3-8
 *@Desc   : 获取伙伴列表
 */
- (void) getCompanionList:(NSNumber *) customerId
{
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"CustomerService",@"servicename",
                           @"getparentchild",@"action",
                           customerId,@"customerid",
                           @"3",@"depth",
                           USERNAME,@"username",
                           PRIVATEKEY,@"privatekey",
                           nil];
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para];
}

#pragma mark - 获取指定产品类别的产品清单
/*
 *@author : 马瑞鹏
 *@date   : 2012-3-10
 *@Desc   : 获取指定产品类别的产品清单
 */
- (void) getCategoryDetail:(NSNumber *) categoryid
{
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"ProductService",@"servicename",
                           @"getproduct",@"action",
                           categoryid,@"categoryid",
                           @"15",@"count",
                           USERNAME,@"username",
                           PRIVATEKEY,@"privatekey",
                           nil];
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para];
}

#pragma mark - 根据订单状态获取订单
/*
 *@author : 马瑞鹏
 *@date   : 2012-3-12
 *@Desc   : 根据订单状态获取订单 1,2,3[1:注册 单 2:零售单 3:升级]
 */
- (void) getOrder:(NSNumber *) categoryid andType:(int) orderType
{
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"OrderService",@"servicename",
                           @"getproduct",@"action",
                           categoryid,@"categoryid",
                           @"15",@"count",
                           USERNAME,@"username",
                           PRIVATEKEY,@"privatekey",
                           nil];
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para];

}

#pragma mark - 获取公告
/*
 *@author : 马瑞鹏
 *@date   : 2012-3-15
 *@Desc   : 获取公告
 */
- (void) getBulletin
{
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"BulletinService",@"servicename",
                           @"getall",@"action",
                           USERNAME,@"username",
                           PRIVATEKEY,@"privatekey",
                           nil];
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para];
}

#pragma mark - 根据id获取公告
/*
 *@author : 马瑞鹏
 *@date   : 2012-3-15
 *@Desc   : 根据id获取公告
 */
- (void) getBulletinById:(NSNumber *)bulletinID
{
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"BulletinService",@"servicename",
                           @"getbyid",@"action",
                           bulletinID,@"bulletinid",
                           @"1",@"page",
                           @"10",@"pagesize",
                           USERNAME,@"username",
                           PRIVATEKEY,@"privatekey",
                           nil];
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para];
}

#pragma mark - 文件下载
/*
 *@author : 马瑞鹏
 *@date   : 2012-3-15
 *@Desc   : 文件下载
 */
- (void) getFileDownloadList
{
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"FileService",@"servicename",
                           @"getbypage",@"action",
                           @"1",@"Pageindex",
                           @"10",@"Pagesize",
                           USERNAME,@"username",
                           PRIVATEKEY,@"privatekey",
                           nil];
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para];
}

#pragma mark - 发留言
/*
 *@author : 马瑞鹏
 *@date   : 2012-3-16
 *@Desc   : 发留言
 */
- (void) sendMessage:(NSNumber *) customerId 
            andTitle:(NSString *) title
          andContent:(NSString *) content;
{
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"MessageService",@"servicename",
                           @"add",@"action",
                           customerId,@"customerid",
                           title,@"title",
                           content,@"content",
                           USERNAME,@"username",
                           PRIVATEKEY,@"privatekey",
                           nil];
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para];
}

#pragma mark - 获取留言
/*
 *@author : 马瑞鹏
 *@date   : 2012-3-16
 *@Desc   : 获取留言
 */
- (void) getMessage:(NSNumber *) customerId andMessageType:(MessageType) type
{
    NSString * maction = nil;
    switch (type) {
        case Message_Send:
            maction = @"sender";
            break;
        case Message_Receive:
            maction = @"receiver";
            break;    
        default:
            break;
    }
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"MessageService",@"servicename",
                           @"getmessagebycustomeridandaction",@"action",
                           customerId,@"customerid",
                           maction,@"maction",
                           @"1",@"page",
                           @"10",@"pagesize",
                           USERNAME,@"username",
                           PRIVATEKEY,@"privatekey",
                           nil];
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para];
}

/*
 *@author : 马瑞鹏
 *@date   : 2012-3-16
 *@Desc   : 根据id获取留言
 */
- (void) getMessageById:(NSNumber *) msgId
{
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"MessageService",@"servicename",
                           @"getbyid",@"action",
                           msgId,@"messageid",                         
                           USERNAME,@"username",
                           PRIVATEKEY,@"privatekey",
                           nil];
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para];
}

#pragma mark - 获取收货地址
/*
 *@author : 马瑞鹏
 *@date   : 2012-3-17
 *@Desc   : 获取收货地址
 */
- (void) getDeliverAddr:(NSNumber *) entityId
{
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"ContactService",@"servicename",
                           @"getbyid",@"action",
                           entityId,@"entityid",
                           @"customer",@"entitytype",
                           USERNAME,@"username",
                           PRIVATEKEY,@"privatekey",
                           nil];
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para];
}

#pragma mark - 更新收货地址
/*
 *@author : 马瑞鹏
 *@date   : 2012-3-17
 *@Desc   : 更新收货地址
 */
- (void) updateDeliverAddr:(NSString *) addr 
             andContactMan:(NSString *) contactMan
                andZipCode:(NSString *) zipCode
                 andMobile:(NSString *) mobile
              andContactId:(NSNumber *) contactId
{
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"ContactService",@"servicename",
                           @"update",@"action",
                           addr,@"address",
                           contactMan,@"contactman",
                           zipCode,@"post",
                           mobile,@"mobilephone",
                           contactId,@"contactid",
                           USERNAME,@"username",
                           PRIVATEKEY,@"privatekey",
                           nil];
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para];
}

#pragma mark - 获得个人资料
/*
 *@author : 马瑞鹏
 *@date   : 2012-3-17
 *@Desc   : 获得个人资料
 */
- (void) getPersonalInfo:(NSNumber *) customerId
{
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"CustomerService",@"servicename",
                           @"getbyid",@"action",
                           customerId,@"customerid",
                           USERNAME,@"username",
                           PRIVATEKEY,@"privatekey",
                           nil];
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para];
}

#pragma mark - 更新个人资料
/*
 *@author : 马瑞鹏
 *@date   : 2012-3-17
 *@Desc   : 更新个人资料
 */
- (void) updatePersonalInfo:(NSNumber *) customerId 
                andNickName:(NSString *) nickName
                andBirthday:(NSString *) birthday
                     andSex:(NSString *) sex
{
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"CustomerService",@"servicename",
                           @"updategeneral",@"action",
                           customerId,@"customerid",
                           nickName,@"nickname",
                           birthday,@"birthday",
                           sex,@"sex",
                           USERNAME,@"username",
                           PRIVATEKEY,@"privatekey",
                           nil];
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para];
}

#pragma mark - 更新一级密码
/*
 *@author : 马瑞鹏
 *@date   : 2012-3-17
 *@Desc   : 更新一级密码
 */
- (void) updateFirstPwd:(NSNumber *) customerId 
              andOldPwd:(NSString *) oldPwd
              andNewPwd:(NSString *) newPwd
{
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"PasswordService",@"servicename",
                           @"updatepassword1",@"action",
                           customerId,@"customerid",
                           oldPwd,@"oldpassword",
                           newPwd,@"newpassword",
                           USERNAME,@"username",
                           PRIVATEKEY,@"privatekey",
                           nil];
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para];
}

#pragma mark - 更新二级密码
/*
 *@author : 马瑞鹏
 *@date   : 2012-3-17
 *@Desc   : 更新二级密码
 */
- (void) updateSecondPwd:(NSNumber *) customerId 
               andOldPwd:(NSString *) oldPwd
               andNewPwd:(NSString *) newPwd
{
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"PasswordService",@"servicename",
                           @"updatepassword2",@"action",
                           customerId,@"customerid",
                           oldPwd,@"oldpassword",
                           newPwd,@"newpassword",
                           USERNAME,@"username",
                           PRIVATEKEY,@"privatekey",
                           nil];
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para];
}

#pragma mark - 获取银行列表
/*
 *@author : 马瑞鹏
 *@date   : 2012-3-19
 *@Desc   : 获取银行列表
 */
- (void) getBankList
{
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"DictionaryService",@"servicename",
                           @"getbanklist",@"action",
                           USERNAME,@"username",
                           PRIVATEKEY,@"privatekey",
                           nil];
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para];
}


#pragma mark - 获取个人银行信息
/*
 *@author : 马瑞鹏
 *@date   : 2012-3-19
 *@Desc   : 获取个人银行信息
 */
- (void) getPersonalBankEntity:(NSNumber *) entityid 
{
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"BankService",@"servicename",
                           @"getbyentityid",@"action",
                           @"customer",@"entitytype",
                           entityid,@"entityid",
                           USERNAME,@"username",
                           PRIVATEKEY,@"privatekey",
                           nil];
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para];
}

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
                     andAccountno:(NSString *) accountno
{
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"BankService",@"servicename",
                           @"update",@"action",
                           bankid,@"bankid",
                           bankCode,@"bank",
                           branch,@"branch",
                           accountname,@"accountname",
                           accountno,@"accountno",
                           USERNAME,@"username",
                           PRIVATEKEY,@"privatekey",
                           nil];
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para];
}

#pragma mark - 提交汇款登记
/*
 *@author : 马瑞鹏
 *@date   : 2012-3-19
 *@Desc   : 提交汇款登记
 */
- (void) commitSendMoneyRegistraion:(NSNumber *) customerid 
                        andFullName:(NSString *) fullName
                     andAccountType:(NSNumber *) accountType
                           andMoney:(NSString *) money
                       andRemittime:(NSString *) accountno
                          andMobile:(NSString *) mobile
                        andSerialNo:(NSString *) serialno
                            andMemo:(NSString *) memo
{
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"WalletSerivce",@"servicename",
                           @"walletremitregadd",@"action",
                           customerid,@"customerid",
                           fullName,@"fullname",
                           accountType,@"accounttype",
                           money,@"money",
                           accountno,@"accountno",
                           mobile,@"mobile",
                           serialno,@"serialno",
                           memo,@"memo",
                           USERNAME,@"username",
                           PRIVATEKEY,@"privatekey",
                           nil];
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para];
}

#pragma mark - 根据发货状态获取订单
/*
 *@author : 马瑞鹏
 *@date   : 2012-3-19
 *@Desc   : 根据发货状态获取订单
 */
- (void) getOrderBySendGoodStatus:(NSNumber *)customerId andStatus:(int)flowstatus
{
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"OrderSerivce",@"servicename",
                           @"getorderbyflowstatus",@"action",
                           customerId,@"customerid",
                           [NSNumber numberWithInt:flowstatus],@"flowstatus",
                           [NSNumber numberWithInt:0],@"page",
                           USERNAME,@"username",
                           PRIVATEKEY,@"privatekey",
                           nil];
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para];
}

#pragma mark - 根据会员 ID 和电子账户类型获 取交易记录
/*
 *@author : 马瑞鹏
 *@date   : 2012-3-19
 *@Desc   : 根据会员 ID 和电子账户类型获 取交易记录
 */
- (void) getTradeRecordByCustomerID:(NSNumber *) customerId
                     andAccountType:(int) accountType
{
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"WalletSerivce",@"servicename",
                           @"getwalletrecords",@"action",
                           customerId,@"customerid",
                           [NSNumber numberWithInt:accountType],@"accounttype",
                           [NSNumber numberWithInt:1],@"page",
                           [NSNumber numberWithInt:10],@"pagesize",
                           USERNAME,@"username",
                           PRIVATEKEY,@"privatekey",
                           nil];
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para];
}

#pragma mark - 更新订单状态
/*
 *@author : 马瑞鹏
 *@date   : 2012-3-19
 *@Desc   : 更新订单状态
 */
- (void) updateFlowStatus:(NSString *) orderId
{
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"OrderSerivce",@"servicename",
                           @"updateflowstatus",@"action",
                           orderId,@"orderid",
                           [NSNumber numberWithInt:1],@"flowstatus",
                           USERNAME,@"username",
                           PRIVATEKEY,@"privatekey",
                           nil];
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para];
}

#pragma mark - 获取所有订单
/*
 *@author : 马瑞鹏
 *@date   : 2012-3-20
 *@Desc   : 获取所有订单
 */
- (void) getOrderAll:(NSNumber *) customerId
{
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"OrderSerivce",@"servicename",
                           @"getordersall",@"action",
                           customerId,@"customerid",
                           [NSNumber numberWithInt:0],@"page",
                           USERNAME,@"username",
                           PRIVATEKEY,@"privatekey",
                           nil];
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para];
}

/*
 *@author : 马瑞鹏
 *@date   : 2012-3-20
 *@Desc   : 根据类型获取订单
 */
- (void) getOrderByType:(int) type
          andCustomerId:(NSNumber *) customerId
{
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"OrderSerivce",@"servicename",
                           @"getordersall",@"action",
                           customerId,@"customerid",
                           [NSNumber numberWithInt:0],@"page",
                           [NSNumber numberWithInt:type],@"ordertype",
                           USERNAME,@"username",
                           PRIVATEKEY,@"privatekey",
                           nil];
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para];
}

#pragma mark - 获取推荐网络
/*
 *@author : 马瑞鹏
 *@date   : 2012-3-21
 *@Desc   : 获取推荐网络
 */
- (void) getRecommentNetworkWithDepth:(int) depth
                        andCustomerId:(NSNumber *) customerId
{
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"NetworkService",@"servicename",
                           @"getrnetwork",@"action",
                           customerId,@"customerid",
                           [NSNumber numberWithInt:depth],@"depth",
                           USERNAME,@"username",
                           PRIVATEKEY,@"privatekey",
                           nil];
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para];
}

#pragma mark - 获取安置网络
/*
 *@author : 马瑞鹏
 *@date   : 2012-3-21
 *@Desc   : 获取推荐网络
 */
- (void) getSettleNetworkWithDepth:(int) depth
                        andCustomerId:(NSNumber *) customerId
{
    NSDictionary * para = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"NetworkService",@"servicename",
                           @"getpnetwork",@"action",
                           customerId,@"customerid",
                           [NSNumber numberWithInt:depth],@"depth",
                           USERNAME,@"username",
                           PRIVATEKEY,@"privatekey",
                           nil];
    [self setHttpRequestPostWithUrl:SERVER_ADDRESS params:para];
}
@end
