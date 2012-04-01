//
//  TGTextField.h
//  ZhongKeBeiRuanIpad
//
//  Created by 瑞鹏 马 on 12-3-29.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TGTextFieldNotificationCenter.h"
@interface TGTextField : UITextField
{
    CGRect superViewRect;
}
- (void) toBeListened;
- (void) notBeListened;
@end
