//
//  GeneralInfoCell.h
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-4-1.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

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
