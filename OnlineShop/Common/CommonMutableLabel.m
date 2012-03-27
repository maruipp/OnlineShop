//
//  CommonMutableLabel.m
//  Mis
//
//  Created by 瑞鹏 马 on 12-2-29.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "CommonMutableLabel.h"

@implementation CommonMutableLabel
- (id) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //使label内的文字可以换行
        self.lineBreakMode   = UILineBreakModeCharacterWrap;
        self.numberOfLines   = 0;
    }
    return self;
}

//调用此函数前要设置label字体
-(void) setText:(NSString *)text
{
  
    text = [NSString stringWithFormat:@"%@",text];
    [super setText:text];
    if ([text isEqualToString:@""] ||  nil == text) {
        return;
    }
    //根据设置的文字的高度调整文字所在label的高度
    CGSize maximumLabelSize = self.frame.size;
    CLog(@"%@,%@",text,NSStringFromCGSize(maximumLabelSize));
    //   maximumLabelSize.width =   250;
    maximumLabelSize.height =   480;
    CGSize expectedLabelSize = CGSizeZero;
    CGPoint pos = self.frame.origin;
    expectedLabelSize = [text sizeWithFont:self.font 
                         constrainedToSize:maximumLabelSize 
                             lineBreakMode:UILineBreakModeWordWrap];
    if (expectedLabelSize.height < self.frame.size.height) {
        return;
    }
    self.frame     =   CGRectMake(pos.x, pos.y, self.frame.size.width, expectedLabelSize.height);
    CLog(@"%@", text);
}
@end
