//
//  ProductDetailLine4Cell.m
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-4-2.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "ProductDetailLine4Cell.h"

@implementation ProductDetailLine4Cell
@synthesize dataDic = _dataDic;

- (void) dealloc
{
    [label11 release];
    [label13 release];
    [_dataDic release];
    [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //self.textLabel.text = @"产品描述";
        self.textLabel.font = [UIFont systemFontOfSize:15];
        int offsetx = 10;
        
        TGLabel * label00 = [[[TGLabel alloc] initWithFrame:CGRectMake(offsetx, 5, 140, 20)] autorelease];
        label00.text = @"产品属性";
        [self addSubview:label00];
        TGLabel * label10 = [[[TGLabel alloc] initWithFrame:CGRectMake(offsetx, 30, 40, 30)] autorelease];
        label10.text = @"版型:";
        [self addSubview:label10];
        label11 = [[TGLabel alloc] initWithFrame:CGRectMake(offsetx + label10.frame.size.width, 30, 100, 30)];
        //label11.text = @"版型:";
        [self addSubview:label11];
        TGLabel * label12 = [[[TGLabel alloc] initWithFrame:CGRectMake(160, 30, 60, 30)] autorelease];
        label12.text = @"材质明细:";
        [self addSubview:label12];
        label13 = [[TGLabel alloc] initWithFrame:CGRectMake(160 + label12.frame.size.width, 30, 60, 30)];
        //label11.text = @"版型:";
        [self addSubview:label13];
        
        label10.alpha = 0.7;
        label11.alpha = 0.7;
        label12.alpha = 0.7;
        label13.alpha = 0.7;
        
        label10.font = [UIFont systemFontOfSize:11];
        label11.font = [UIFont systemFontOfSize:11];
        label12.font = [UIFont systemFontOfSize:11];
        label13.font = [UIFont systemFontOfSize:11];
        label00.font = [UIFont systemFontOfSize:15];
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}

- (void) setDataDic:(NSMutableDictionary *)dataDic
{
    if (_dataDic) {
        [_dataDic release];
        _dataDic = nil;
        
    }
    _dataDic = [dataDic retain];
    label11.text = @"基础款（男）";
    label13.text = @"100％棉";
   
}

@end
