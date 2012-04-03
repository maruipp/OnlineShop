//
//  ProductDetailLine3Cell.m
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-4-3.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "ProductDetailLine3Cell.h"

@implementation ProductDetailLine3Cell
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
        self.textLabel.text = @"产品描述";
        self.textLabel.font = [UIFont systemFontOfSize:15];
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}
@end
