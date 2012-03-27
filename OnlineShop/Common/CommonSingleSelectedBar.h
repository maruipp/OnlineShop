//
//  CommonSingleSelectedBar.h
//  ZhongKeBeiRuan
//
//  Created by 瑞鹏 马 on 12-3-3.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SingleSelectedBarDelegate;

//标签序号从0开始
@interface CommonSingleSelectedBar : UIView
@property (nonatomic,retain) NSArray * imageArray;
@property (nonatomic,retain) UIButton * bkButton;
@property (nonatomic,assign) id<SingleSelectedBarDelegate> delegate;
-(id) initWithImageArray:(NSArray *) imageArray;
@end

@protocol SingleSelectedBarDelegate <NSObject>

-(void) buttonOfIndexClicked:(int) index;

@end
