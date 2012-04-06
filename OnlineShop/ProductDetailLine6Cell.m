//
//  ProductDetailLine6Cell.m
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-4-3.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "ProductDetailLine6Cell.h"

@implementation ProductDetailLine6Cell
@synthesize dataDic = _dataDic;
- (void) dealloc
{
    [_dataDic release];
    [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        TGButton * btn = [TGButton buttonWithType:UIButtonTypeRoundedRect];
        btn.frame = CGRectMake(40, 5, 240, 30);
        btn.titleLabel.textAlignment = UITextAlignmentCenter;
        [btn setTitle:@"订购电话 400 600 6888" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(dialHotLine:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    return self;
}

- (void) dialHotLine:(id) sender
{
    //TGButton * btn = sender;
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:nil message:@"400-600-6888" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"呼叫   ", nil];
    [alert show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    CLog(@"%i",buttonIndex);
    if (1 == buttonIndex) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:4006006888"]];
    }
}
@end
