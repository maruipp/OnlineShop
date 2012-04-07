//
//  SettlementCenterCell7.m
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-4-7.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "SettlementCenterCell32.h"

@implementation SettlementCenterCell32

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
        TGLabel * label00 = [[[TGLabel alloc] initWithFrame:CGRectMake(self.indentationLevel * self.indentationWidth, 0, 120, 20)] autorelease];
        label00.text = @"产品数量总计";
        [self addSubview:label00];
        
        label01 = [[[TGLabel alloc] initWithFrame:CGRectMake(self.indentationLevel * self.indentationWidth + label00.frame.size.width, label00.frame.origin.y, 320, label00.frame.size.height)] autorelease];
        [self addSubview:label01];
        
        //line 1
        TGLabel * label10 = [[[TGLabel alloc] initWithFrame:CGRectMake(self.indentationLevel * self.indentationWidth, label00.frame.size.height + label00.frame.origin.y, 120, 20)] autorelease];
        label10.text = @"赠送积分总计";
        [self addSubview:label10];
        
        
        label11 = [[[TGLabel alloc] initWithFrame:CGRectMake(self.indentationLevel * self.indentationWidth + label10.frame.size.width, label00.frame.size.height + label00.frame.origin.y, 320, 20)] autorelease];
        [self addSubview:label11];
        
        //line 2
        TGLabel * label20 = [[[TGLabel alloc] initWithFrame:CGRectMake(self.indentationLevel * self.indentationWidth, label10.frame.size.height + label11.frame.origin.y, 120, 20)] autorelease];
        label20.text = @"产品金额总计";
        [self addSubview:label20];
        
        label21 = [[[TGLabel alloc] initWithFrame:CGRectMake(self.indentationLevel * self.indentationWidth  + label20.frame.size.width, label11.frame.size.height + label11.frame.origin.y, 320, 20)] autorelease];
        [self addSubview:label21];
        
        //line 3
        TGLabel * label30 = [[[TGLabel alloc] initWithFrame:CGRectMake(self.indentationLevel * self.indentationWidth, label20.frame.size.height + label20.frame.origin.y, 120, 20)] autorelease];
        label30.text = @"运费";
        [self addSubview:label30];
        
        label31 = [[[TGLabel alloc] initWithFrame:CGRectMake(self.indentationLevel * self.indentationWidth + label30.frame.size.width, label20.frame.size.height + label20.frame.origin.y, 320, 20)] autorelease];
        [self addSubview:label31];
        
        //line 4
        TGLabel * label40 = [[[TGLabel alloc] initWithFrame:CGRectMake(self.indentationLevel * self.indentationWidth, label30.frame.size.height + label30.frame.origin.y, 120, 20)] autorelease];
        label30.text = @"您需要为订单支付";
        [self addSubview:label40];
        
        label41 = [[[TGLabel alloc] initWithFrame:CGRectMake(self.indentationLevel * self.indentationWidth + label40.frame.size.width, label30.frame.size.height + label30.frame.origin.y, 320, 20)] autorelease];
        [self addSubview:label41];
        
        int fontSize = 13;
        label00.font = [UIFont systemFontOfSize:fontSize];
        label01.font = [UIFont systemFontOfSize:fontSize];
        label10.font = [UIFont systemFontOfSize:fontSize];
        label11.font = [UIFont systemFontOfSize:fontSize];
        label20.font = [UIFont systemFontOfSize:fontSize];
        label21.font = [UIFont systemFontOfSize:fontSize];
        label30.font = [UIFont systemFontOfSize:fontSize];
        label31.font = [UIFont systemFontOfSize:fontSize];
        label40.font = [UIFont systemFontOfSize:fontSize];
        label41.font = [UIFont systemFontOfSize:fontSize];
        
        float alpha = 0.7;
        label00.alpha = alpha;
        label01.alpha = alpha;
        label10.alpha = alpha;
        label11.alpha = alpha;
        label20.alpha = alpha;
        label21.alpha = alpha;
        label30.alpha = alpha;
        label31.alpha = alpha;
        label40.alpha = alpha;
        label41.alpha = alpha;
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
    label11.text = @"马瑞鹏";
    label21.text = @"18610346075";
    label31.text = @"北京交通大学";
}

@end
