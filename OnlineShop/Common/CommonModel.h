//
//  CommonModel.h
//  ZhongKeBeiRuan
//
//  Created by 瑞鹏 马 on 12-3-16.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MRPNetwork.h"
#import "PublicShareDef.h"

@protocol CommonModelDelegate;

@interface CommonModel : NSObject
{
    MRPNetwork * network;
}
@property (nonatomic,retain) NSMutableArray * keyArray;//key 和title的数组
@property (nonatomic,assign) id<CommonModelDelegate> delegate;
#pragma mark - 读服务器数据
- (void) readServer;
#pragma mark - 读配置文件数据
- (void) readConfigFile:(NSString *) childKey;
@end


@protocol CommonModelDelegate <NSObject>
//向view传数据
- (void) deliverKeyArray:(NSArray *) keyAndTitleArray andDataDic:(NSDictionary *) dataDic;

@end