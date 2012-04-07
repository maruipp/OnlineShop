//
//  SettlementCenterCell3.m
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-4-7.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "SettlementCenterCell10.h"

@implementation SettlementCenterCell10

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
        self.indentationLevel = 2;
        //line 0 
        TGLabel * label00 = [[[TGLabel alloc] initWithFrame:CGRectMake(self.indentationLevel * self.indentationWidth, 0, 320, 40)] autorelease];
        label00.text = @"礼品卡：";
        [self addSubview:label00];
        
        //line 1
        TGLabel * label10 = [[[TGLabel alloc] initWithFrame:CGRectMake(self.indentationLevel * self.indentationWidth, label00.frame.size.height + label00.frame.origin.y, 200, 20)] autorelease];
        label10.text = @"点击选择或输入礼品卡";
        [self addSubview:label10];
        
        
        label11 = [[[TGLabel alloc] initWithFrame:CGRectMake(self.indentationLevel * self.indentationWidth + label10.frame.size.width, label00.frame.size.height + label00.frame.origin.y, 320, 20)] autorelease];
        [self addSubview:label11];
        
        int fontSize = 13;
        label10.font = [UIFont systemFontOfSize:fontSize];
        label11.font = [UIFont systemFontOfSize:fontSize];
        
        float alpha = 0.7;
        label10.alpha = alpha;
        label11.alpha = alpha;
        
        label11.textColor = [UIColor blueColor];
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
    //label11.text = @"现金支付（或到付款）";
}

@end
