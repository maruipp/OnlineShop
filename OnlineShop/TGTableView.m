//
//  TGTableView.m
//  ZhongKeBeiRuanIpad
//
//  Created by 瑞鹏 马 on 12-3-28.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "TGTableView.h"

@implementation TGTableView


- (id) initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style]) {
        self.backgroundColor = [UIColor clearColor];
        self.showsVerticalScrollIndicator = NO;
    }
    return self;
}
@end
