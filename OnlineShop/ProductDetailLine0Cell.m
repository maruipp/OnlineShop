//
//  ProductDetailLine0Cell.m
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-4-2.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "ProductDetailLine0Cell.h"

@implementation ProductDetailLine0Cell
@synthesize dataDic = _dataDic;
- (void) dealloc
{
    [_dataDic release];
    [nameLabel release];
    [idLabel release];
    [priceLabel release];
    [super dealloc];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        nameLabel = [[TGLabel alloc] initWithFrame:CGRectMake(10, 0, 310, 20)];
        [self addSubview:nameLabel];
        TGLabel * pID = [[[TGLabel alloc] initWithFrame:CGRectMake(10, 20, 80, 20)] autorelease];
        pID.text = @"商品编号：";
        [self addSubview:pID];
        idLabel = [[TGLabel alloc] initWithFrame:CGRectMake(90, 20, 230, 20)];
        [self addSubview:idLabel];
        TGLabel * pPrice = [[[TGLabel alloc] initWithFrame:CGRectMake(10, 40, 40, 20)] autorelease];
        pPrice.text = @"售价：";
        [self addSubview:pPrice];
        priceLabel = [[TGLabel alloc] initWithFrame:CGRectMake(50, 40, 270, 20)];
        [self addSubview:priceLabel];
        
        nameLabel.font = [UIFont systemFontOfSize:15];
        pID.font = [UIFont systemFontOfSize:11];
        idLabel.font = [UIFont systemFontOfSize:11];
        pPrice.font = [UIFont systemFontOfSize:11];
        priceLabel.font = [UIFont systemFontOfSize:11];
        
        pID.alpha = 0.7;
        idLabel.alpha = 0.7;
        pPrice.alpha = 0.7;
        priceLabel.alpha = 0.7;
    }
    return self;
}

- (void) setDataDic:(NSMutableDictionary *)dataDic
{
    if (_dataDic) {
        [_dataDic release];
        _dataDic = nil;
        
    }
    _dataDic = [dataDic retain];
    nameLabel.text = @"巴拉l把b喇叭啦巴拉把l吧blalba";
    idLabel.text = @"0120778";
    priceLabel.text = @"29.00";
}

@end
