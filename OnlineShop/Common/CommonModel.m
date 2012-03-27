//
//  CommonModel.m
//  ZhongKeBeiRuan
//
//  Created by 瑞鹏 马 on 12-3-16.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "CommonModel.h"

@implementation CommonModel
@synthesize keyArray = _keyArray;
@synthesize delegate = _delegate;
- (void) dealloc
{
    [_keyArray release];
    [network stopHttpRequest];
    [super dealloc];
}
- (id) init
{
    if (self = [super init]) {
        network = [[MRPNetwork alloc] initWithTarget:self action:@selector(getReturnValue:obj:)];
        [self readServer];
    }
    return self;
}

#pragma mark - 读配置文件数据
- (void) readConfigFile:(NSString *) childKey
{
    NSMutableDictionary * dic = List_ITEM_CONFIG;
    self.keyArray = [dic objectForKey:childKey];
}
#pragma mark - 读服务器数据,在里面调服务器接口即可
- (void) performNetworkAction:(SEL) aAction
{
    if ([network respondsToSelector:aAction]) {
        [network performSelector:aAction];
    }
}
#pragma mark - 接收返回数据
-(void)getReturnValue:(MRPNetwork *)sender obj:(NSDictionary *)obj
{
    //若网络请求已经返回，则将network置为nil（因为此时network已被释放，其已成为野指针）
    network = nil;
    
    CLog(@"getReturnValue");
    //判断是否出错
    if (sender.hasError||obj==nil) {
        [sender alert];
        return;
    }
    [_delegate deliverKeyArray:_keyArray andDataDic:obj];
}
@end
