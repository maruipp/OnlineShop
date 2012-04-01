//
//  ZKQuickButtonView.m
//  ZhongKeBeiRuan
//
//  Created by 瑞鹏 马 on 12-3-1.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "ZKQuickButtonView.h"

@implementation ZKQuickButtonView
@synthesize indentifier = _indentifier;
-(void) dealloc
{
    [textLabel release];
    [super dealloc];
}
//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        // Initialization code
//        button = [UIButton buttonWithType:UIButtonTypeCustom];
//        button.frame = CGRectMake(10, 20, 60, 60);
//        [self addSubview:button];
//        
//        text = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, 80, 20)];
//    }
//    return self;
//}

- (id) init
{
    self = [super initWithFrame:CGRectMake(0, 0, 145, QUICK_BUTTON_HEIGHT)];
    if (self) {
        // Initialization code
        button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(4, 4, QUICK_BUTTON_IMAGE_SIDE_LENGTH, QUICK_BUTTON_IMAGE_SIDE_LENGTH);
       // [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        textLabel = [[UILabel alloc] initWithFrame:CGRectMake(4, 138, QUICK_BUTTON_IMAGE_SIDE_LENGTH, 31)];
        textLabel.textAlignment = UITextAlignmentCenter;
        textLabel.font = [UIFont systemFontOfSize:12];
        textLabel.backgroundColor = [UIColor colorWithRed:148/255.0 green:148/255.0 blue:148/255.0 alpha:1.0];
        [self  addSubview:textLabel];
        
        self.backgroundColor = [UIColor grayColor];
    }
    return self;
}

-(void) setImage:(NSString *)image andTitle:(NSString *) title
{
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    textLabel.text = title;
}

-(void) setPosition:(CGPoint) pos
{
    CGRect temp = self.frame;
    temp.origin = pos;
    self.frame = temp;
}

-(void) setIndentifier:(int)indentifier
{
    _indentifier = indentifier;
    button.tag = _indentifier;
}
- (void)addTarget:(id)target action:(SEL)action
{
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}
//使button不响应点击
- (void) setDisable:(BOOL) yesOr
{
    if (yesOr) {
        button.enabled =  NO;
    }
}
@end
