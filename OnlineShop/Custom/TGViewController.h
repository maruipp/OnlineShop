//
//  TGViewController.h
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-3-28.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MRPNetwork.h"
#import "MBProgressHUD.h"
@interface TGViewController : UIViewController<MBProgressHUDDelegate>
{
    MBProgressHUD * progress_;
    //UIView * progressView;  //供进度条定位用
    NSMutableArray * dataArray;
    MRPNetwork * network;
}
#pragma mark - 进度条管理
- (void)initProgressHD;
- (void)hiddenProgress;
- (void) readData:(int) index;
-(void)getReturnValue:(MRPNetwork *)sender obj:(NSDictionary *)obj;
@end
