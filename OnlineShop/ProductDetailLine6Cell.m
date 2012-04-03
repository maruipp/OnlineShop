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
        [self addSubview:btn];
    }
    return self;
}
@end
