//
//  CommonRadioBox.h
//  ZhongKeBeiRuan
//
//  Created by 瑞鹏 马 on 12-3-6.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonRadioBox : UIView

@property (nonatomic,retain) UIButton * aZone;
@property (nonatomic,retain) UIButton * bZone;

@property (nonatomic,retain) UILabel * aZoneLabel;
@property (nonatomic,retain) UILabel * bZoneLabel;

@property (nonatomic,assign) int curSelZone;
- (void) setAZoneTitle:(NSString *)aZoneStr andBZoneTitle:(NSString *)bZoneStr;
- (void) setSelectZoneOfIndex:(int) index;
@end
