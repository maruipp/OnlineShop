//
//  MisLoginTableViewCell.m
//  Mis
//
//  Created by 瑞鹏 马 on 12-2-20.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "CommonLoginTableViewCell.h"

@implementation CommonLoginTableViewCell
@synthesize sideLabel = _sideLabel;
@synthesize textField = _textField;
-(void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_sideLabel release];
    [_textField release];
    [super dealloc];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 标题标签
        _sideLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 2, 84, 40)];
        _sideLabel.textAlignment = UITextAlignmentCenter;
        [self addSubview:_sideLabel];//UIGestureRecognizer
        
        //文本输入框
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(94, 2, 216, 40)];
        //竖直方向居中
        _textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        [self addSubview:_textField];
        
        //设透明
        _sideLabel.backgroundColor = [UIColor clearColor];
        _textField.backgroundColor = [UIColor clearColor];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cancelKeyboard) name:NOTIFICATION_HIDE_KEYBOARD_IN_LOGINVIEW object:nil];
    }
    return self;
}

- (void) cancelKeyboard
{
    [_textField resignFirstResponder];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

// 设置placeholder
-(void) setPlaceholder:(NSString *) placeholderStr
{
    [_textField setPlaceholder:placeholderStr];
}
@end
