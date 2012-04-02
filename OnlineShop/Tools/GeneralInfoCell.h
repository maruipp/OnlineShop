//
//  GeneralInfoCell.h
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-4-1.
//  Copyright (c) 2012年 BJTU. All rights reserved.
// 图片，商品描述，价格，颜色（或者星级）

#import "TGTableViewCell.h"
#import "ImageButton.h"
@interface GeneralInfoCell : TGTableViewCell
{
    ImageButton * imageBtn;
    TGLabel * descLabel;
    TGLabel * priceLabel;
    //TGLabel 
}
@property (nonatomic,retain) NSDictionary * dataDic;
@end
