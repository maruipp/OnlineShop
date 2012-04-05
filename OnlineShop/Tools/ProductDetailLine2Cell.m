//
//  ProductDetailLine2Cell.m
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-4-2.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "ProductDetailLine2Cell.h"

@implementation ProductDetailLine2Cell
@synthesize dataDic = _dataDic;
- (void) dealloc
{
    [_dataDic release];
    [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        TGButton * btn00 = [TGButton buttonWithType:UIButtonTypeCustom];
        btn00.frame = CGRectMake(10, 5, 145, 28);
        [btn00 setImage:[UIImage imageNamed:@"buyNow.png"] forState:UIControlStateNormal];
        //[btn00 setTitle:@"立即购买" forState:UIControlStateNormal];
        [self addSubview:btn00];
        TGButton * btn01 = [TGButton buttonWithType:UIButtonTypeRoundedRect];
        btn01.frame = CGRectMake(165, 5, 145, 28);
        [btn01 setImage:[UIImage imageNamed:@"addToBuyCar.png"] forState:UIControlStateNormal];
        [btn01 setTitle:@"加入购物车" forState:UIControlStateNormal];
        [self addSubview:btn01];
//        TGLabel * label = [[[TGLabel alloc] initWithFrame:CGRectMake(0, 40, 320, 40)] autorelease];
//        [self addSubview:label];
        
        btn00.tintColor = [UIColor redColor];
        btn01.tintColor = [UIColor redColor];
        
        UIImageView * labelImage = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 40, 320, 40)] autorelease];
        [self addSubview:labelImage];
        [labelImage setImage:[UIImage imageNamed:@"descLabel.png"]];
       // label.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"descLabel.png"]];
        //label.text = @"i am a label";
       // btn00.titleLabel.textColor = 
    }
    return self;
}
@end
