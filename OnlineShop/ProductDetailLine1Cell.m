//
//  ProductDetailLine1Cell.m
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-4-2.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "ProductDetailLine1Cell.h"

@implementation ProductDetailLine1Cell
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
        TGLabel * colorLabel = [[[TGLabel alloc] initWithFrame:CGRectMake(10, 6, 40, 30)] autorelease];
        colorLabel.text = @"颜色:";
        [self addSubview:colorLabel];
        TGButton * color = [TGButton buttonWithType:UIButtonTypeRoundedRect];
        color.frame = CGRectMake(50,6, 80, 30);
        [color setTitle:@"深麻灰色" forState:UIControlStateNormal];
        [color addTarget:self action:@selector(colorButtonDown) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:color];
        
        TGLabel * inchSizeLabel = [[[TGLabel alloc] initWithFrame:CGRectMake(180, 6, 60, 30)] autorelease];
        inchSizeLabel.text = @"尺码：";
        [self addSubview:inchSizeLabel];
        TGButton * inchSize = [TGButton buttonWithType:UIButtonTypeRoundedRect];
        inchSize.frame = CGRectMake(240,6, 60, 30);
        [inchSize addTarget:self action:@selector(inchSizeButtonDown) forControlEvents:UIControlEventTouchUpInside];
        [inchSize setTitle:@"S" forState:UIControlStateNormal];
        [self addSubview:inchSize];
        
        colorLabel.font = [UIFont systemFontOfSize:15];
        inchSizeLabel.font = [UIFont systemFontOfSize:15];
        colorLabel.alpha = 0.7;
        inchSizeLabel.alpha = 0.7;
    }
    return self;
}

- (void) colorButtonDown:(TGButton *) sender
{
    
}

- (void) inchSizeButtonDown:(TGButton *) sender
{
    
}
@end
