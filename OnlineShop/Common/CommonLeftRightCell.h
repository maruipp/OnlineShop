//
//  CommonLeftRightCell.h
//  ZhongKeBeiRuan
//
//  Created by 瑞鹏 马 on 12-3-6.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonMutableLabel.h"
@interface CommonLeftRightCell : UITableViewCell
//标题标签
@property (nonatomic,retain) UILabel * sideLabel;
//输入框
@property (nonatomic,retain) CommonMutableLabel * mainLabel;
@end
