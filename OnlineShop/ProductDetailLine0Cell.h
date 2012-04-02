//
//  ProductDetailLine0Cell.h
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-4-2.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "TGTableViewCell.h"

@interface ProductDetailLine0Cell : TGTableViewCell
{
    TGLabel * nameLabel;
    TGLabel * idLabel;
    TGLabel * priceLabel;
}

@property (nonatomic,retain) NSMutableDictionary * dataDic;
@end
