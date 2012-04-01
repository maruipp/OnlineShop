//
//  TGTextFieldNotificationCenter.h
//  ZhongKeBeiRuanIpad
//
//  Created by 瑞鹏 马 on 12-3-31.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "TGTextField.h"
@interface TGTextFieldNotificationCenter : NSObject
{
    NSMutableArray * observerObjects;
    UITextField * activeTextField;
    CGRect superViewRect;
    BOOL keyboardShow;
}
@property (nonatomic, assign) BOOL keyboardShow;
+ (id) defaultCenter;
- (void) addNotification;
- (void) addObserverObject:(UITextField *) obj;
- (void) removeObserverObject:(UITextField *) obj;
#pragma mark        keyboard Methods
-(void) keyboardWillShow:(NSNotification *)note;
-(void) keyboardWillHide:(NSNotification *)note;


@end
