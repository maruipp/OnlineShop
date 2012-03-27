//
//  CommonShowList.m
//  ZhongKeBeiRuan
//
//  Created by 瑞鹏 马 on 12-3-4.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "CommonShowList.h"
#define COMMON_LIST_CELL_HEIGHT 40
@implementation CommonShowList


//configArray负责配置title，和其所对应的值的在dataDic中的key
//dataDic是服务器返回的数据字典
- (id) initWithConfig:(NSArray *) configArray andDic:(NSDictionary *) dataDic
{
    self = [super initWithFrame:CGRectMake(0, 0, 320, 480)];
    if (self) {
        for (int i = 0; i < [configArray count]; i++) {
            NSDictionary * dic = [configArray objectAtIndex:i];
            NSString * title = [dic objectForKey:@"title"];
            NSString * key   = [dic objectForKey:@"key"];
            UILabel * left = [[[UILabel alloc] initWithFrame:CGRectMake(0, i * COMMON_LIST_CELL_HEIGHT, 320 * 0.4, COMMON_LIST_CELL_HEIGHT)] autorelease];
            left.textAlignment = UITextAlignmentRight;
            left.text = title;
            [self addSubview:left];
            UILabel * right = [[[UILabel alloc] initWithFrame:CGRectMake(320 * 0.45,i * COMMON_LIST_CELL_HEIGHT, 320 * 0.5, COMMON_LIST_CELL_HEIGHT)] autorelease ];
            right.textAlignment = UITextAlignmentLeft;
            id aaa = [dataDic objectForKey:key];
            CLog(@"Bonus_Profit: %@", aaa );
            right.text = [NSString stringWithFormat:@"%@",[dataDic objectForKey:key] ];
            [self addSubview:right];
        }
    }
    return self;
}

- (void) setPosition:(CGPoint) pos
{
    CGRect rect = self.frame;
    rect.origin = pos;
    self.frame = rect;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
