//
//  CommonLoginView.h
//  ZhongKeBeiRuan
//
//  Created by 瑞鹏 马 on 12-2-29.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PublicShareDef.h"
@interface CommonLoginView : UIView <UITextFieldDelegate>
{
    UILabel * userLabel;
    UILabel * pwdLabel;
    
    UIButton * loginBtn;
}
@property (nonatomic,retain) UITextField * username;
@property (nonatomic,retain) UITextField * password;

//设置label和textfield各自占的宽度的比例
- (void) setRatio:(float) ratio;
@end
