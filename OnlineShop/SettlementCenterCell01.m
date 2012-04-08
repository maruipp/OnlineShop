//
//  SettlementCenterCell1.m
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-4-7.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "SettlementCenterCell01.h"

@implementation SettlementCenterCell01
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
        label00.text = @"支付方式";
        [self addSubview:label00];
        
        //line 1
        TGLabel * label10 = [[[TGLabel alloc] initWithFrame:CGRectMake(self.indentationLevel * self.indentationWidth, label00.frame.size.height + label00.frame.origin.y, 80, 20)] autorelease];
        label10.text = @"货到付款：";
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
    NSInteger index = [[NSUserDefaults standardUserDefaults] integerForKey:PAYMENT_ID_KEY];
    if (index < [PAYMENT_ARRAY count]) {
        label11.text = [PAYMENT_ARRAY objectAtIndex:index];
    }
    else {
        label11.text = [PAYMENT_ARRAY objectAtIndex:0];
    }
    
}
@end
