//
//  CommonSingleSelectedBar.m
//  ZhongKeBeiRuan
//
//  Created by 瑞鹏 马 on 12-3-3.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "CommonSingleSelectedBar.h"


#define SINGLE_SELECTED_BAR_HEIGHT 40

@implementation CommonSingleSelectedBar
@synthesize imageArray = _imageArray;
@synthesize bkButton = _bkButton;
@synthesize delegate = _delegate;
-(void) dealloc
{
    [_bkButton release];
    [super dealloc];
}

-(id) initWithImageArray:(NSArray *) imageArray
{
    //确保titleArray不空
    if ([imageArray count] == 0) {
        CLog(@"单选工具条接收的title数组为空");
        return nil;
    }
    else
    {
        self.imageArray = imageArray;
    }
    
    CGRect frame = CGRectMake(0, 0, 320, SINGLE_SELECTED_BAR_HEIGHT);
    self = [super initWithFrame:frame];
    if (self) {
        //背景
        self.bkButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _bkButton.frame = frame;
        [_bkButton setImage:[UIImage imageNamed:[_imageArray objectAtIndex:0]] forState:UIControlStateNormal];
        [self addSubview:_bkButton];
        
        int count = [_imageArray count];
        for (int i = 0; i < count; i++) {
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.tag = i;
            btn.frame = CGRectMake( i * 320 / count, 0, 320 / count, SINGLE_SELECTED_BAR_HEIGHT);
            [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
            //btn.backgroundColor = [UIColor yellowColor];
        }
    }
    return self;
}
-(void) buttonClicked:(id) sender
{
    UIButton * btn = (UIButton *) sender;
    NSString * imageName = [_imageArray objectAtIndex:btn.tag];
    [_bkButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [_delegate buttonOfIndexClicked:btn.tag];
}
@end
