//
//  CommonLeftRightCell.m
//  ZhongKeBeiRuan
//
//  Created by 瑞鹏 马 on 12-3-6.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "CommonLeftRightCell.h"

@implementation CommonLeftRightCell

@synthesize sideLabel = _sideLabel;
@synthesize mainLabel = _mainLabel;
-(void) dealloc
{
    [_sideLabel release];
    [_mainLabel release];
    [super dealloc];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 标题标签
        _sideLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 2, 150, 40)];
        _sideLabel.textAlignment = UITextAlignmentCenter;
        [self addSubview:_sideLabel];
        
        //文本输入框
        _mainLabel = [[CommonMutableLabel alloc] initWithFrame:CGRectMake(150, 2, 160, 40)];
        //竖直方向居中
        //   _mainLabel.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        [self addSubview:_mainLabel];
        
        //设透明
        _sideLabel.backgroundColor = [UIColor clearColor];
        _mainLabel.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
