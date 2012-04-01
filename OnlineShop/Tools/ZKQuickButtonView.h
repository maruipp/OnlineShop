//
//  ZKQuickButtonView.h
//  ZhongKeBeiRuan
//
//  Created by 瑞鹏 马 on 12-3-1.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import <UIKit/UIKit.h>
#define QUICK_BUTTON_HEIGHT 140
#define QUICK_BUTTON_IMAGE_SIDE_LENGTH 131
@interface ZKQuickButtonView : UIView
{
    UIButton * button;
    UILabel * textLabel;
}
@property   (nonatomic,assign) int indentifier;  //标识

-(void) setImage:(NSString *)image andTitle:(NSString *) title;
-(void) setPosition:(CGPoint) pos;

- (void)addTarget:(id)target action:(SEL)action ;
//使button不响应点击
- (void) setDisable:(BOOL) yesOr;
@end
