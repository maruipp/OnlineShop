//
//  JustifyRenturnValue.m
//  MIX
//
//  Created by  on 11-11-16.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "JustifyRenturnValue.h"


static JustifyRenturnValue * justifyReturnValue = nil ;

@implementation JustifyRenturnValue

+(JustifyRenturnValue *)sharedInstance{
    @synchronized(self)
    {
        if ( justifyReturnValue == nil ) {
            [[self alloc] init];
        }
    }
    return justifyReturnValue;
}

+ (id)allocWithZone:(NSZone *)zone
{
    @synchronized(self) {
        if (justifyReturnValue == nil) {
            justifyReturnValue = [super allocWithZone:zone];
            return justifyReturnValue;  // assignment and return on first allocation
        }
    }
    return nil; //on subsequent allocation attempts return nil
}

-(id)init{
    
    self = [super init];
    if ( self ) {
        
        jsonParser = [[SBJsonParser alloc] init];
        
    }
    return self;
}


- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (id)retain
{
    return self;
}


- (id)autorelease
{
    return self;
}




-(BOOL)isPostOk:(NSString *)jsonString{
    
    NSError *error = nil;
    BOOL returnValue = NO;
    id jsonObject = [jsonParser objectWithString:jsonString error:&error];
    if ([jsonObject isKindOfClass:[NSDictionary class]]){
        if ( [[jsonObject valueForKey:@"Status"] intValue] == 1 ) {
            CLog(@"return result is OK");
            returnValue = YES;
        }
        returnValue = YES;//马瑞鹏2012／3／5修改 原因：有的服务器不使以返回1作为判断是否成功的条件的 或者，返回的不使字典，而是数组
    }
    else //马瑞鹏2012／2／27修改 原因：有的服务器不使以返回1作为判断是否成功的条件的 或者，返回的不使字典，而是数组
    {
        CLog(@"return result is OK");
        returnValue = YES;
    }
    return returnValue;
}


#pragma mark - 专门处理 是否是第一次登录
-(BOOL)isFirstLogin:(NSString *)jsonString{
    
    NSError *error = nil;
    BOOL returnValue = NO;
    id jsonObject = [jsonParser objectWithString:jsonString error:&error];
    if ([jsonObject isKindOfClass:[NSDictionary class]]){
        if ( [[jsonObject valueForKey:@"success"] boolValue]  ) {
            CLog(@"return success");
            if ( [[jsonObject valueForKey:@"data"] boolValue]) {
                returnValue = YES;
            }
            
        }
    }
    return returnValue;
}

#pragma mark - 获取用户ID
-(void)getUserId:(NSString *)jsonString{
    
    NSError *error = nil;
    id jsonObject = [jsonParser objectWithString:jsonString error:&error];
    if ([jsonObject isKindOfClass:[NSDictionary class]]){
        if ( [[jsonObject valueForKey:@"success"] boolValue]  ) {
            CLog(@"-->get user id return success");
            NSDictionary * dataDict = [jsonObject valueForKey:@"data"];
            NSLog(@"the data info is : %@", dataDict );
            NSString * idStr = [dataDict valueForKey:@"id"];
            NSLog(@"the id is : %@", idStr );
            NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
            [userDefaults setValue:[NSNumber numberWithInt:[idStr intValue]] forKey:@"id"];
        }
    }
}
#pragma mark - 获取 数据用户详细信息数据
-(NSDictionary *)getUserDetailsDict:(NSString *)jsonString
{
    NSDictionary * userDetailsDict ;
    NSError *error = nil;
    id jsonObject = [jsonParser objectWithString:jsonString error:&error];
    if ([jsonObject isKindOfClass:[NSDictionary class]]){
        if ( [[jsonObject valueForKey:@"success"] boolValue]  ) {
            CLog(@"-->get user id return success");
            userDetailsDict = [jsonObject valueForKey:@"data"];
            NSLog(@"user data details is : %@", userDetailsDict );
        }
    }
    return userDetailsDict;
}



-(void)dealloc{
    
    [jsonParser release];
    [super dealloc];
}



@end
