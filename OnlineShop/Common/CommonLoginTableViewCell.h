//
//  MisLoginTableViewCell.h
//  Mis
//
//  Created by 瑞鹏 马 on 12-2-20.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonLoginTableViewCell : TGTableViewCell
//标题标签
@property (nonatomic,retain) UILabel * sideLabel;
//输入框
@property (nonatomic,retain) UITextField * textField;
// 设置placeholder
-(void) setPlaceholder:(NSString *) placeholderStr;
@end
