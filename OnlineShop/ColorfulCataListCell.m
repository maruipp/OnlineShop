//
//  ColorfulCataListCell.m
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-4-2.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "ColorfulCataListCell.h"

@implementation ColorfulCataListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.accessoryType = UITableViewCellAccessoryNone;
        self.indentationLevel = 1;
        UIView * bk = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.indentationWidth, self.frame.size.height)] autorelease];
        bk.backgroundColor = [UIColor colorWithRed:rand() % 255 / 255.0 green:rand() % 255 / 255.0 blue:rand() % 255 / 255.0 alpha:1];
        [self addSubview: bk];
    }
    return self;
}

@end
