//
//  GeneralInfoCell.m
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-4-1.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "GeneralInfoCell.h"

@implementation GeneralInfoCell
@synthesize dataDic = _dataDic;
- (void) dealloc
{
    [imageBtn release];
    [super dealloc];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        imageBtn = [[ImageButton alloc] initWithFrame:CGRectMake(2, 5, 80, 80)];
        [self addSubview:imageBtn];
        descLabel = [[TGLabel alloc] initWithFrame:CGRectMake(88, 5, 150, 36)];
        descLabel.lineBreakMode = UILineBreakModeWordWrap;
        descLabel.numberOfLines = 2;
        descLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:descLabel];
        
        priceLabel = [[TGLabel alloc] initWithFrame:CGRectMake(88, 42, 150, 23)];
        [self addSubview:priceLabel];
        self.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

- (void) setDataDic:(NSDictionary *)dataDic
{
    if (dataDic) {
        [dataDic release];
        dataDic = nil;
    }
    _dataDic = [dataDic retain];
    [imageBtn setImage:[UIImage imageNamed:@"IMG_0399.PNG"] forState:UIControlStateNormal];
    descLabel.text = @"经典百搭纯色帆布鞋 草绿色色帆布鞋 草绿色";
    priceLabel.text = @"123";
}
@end
