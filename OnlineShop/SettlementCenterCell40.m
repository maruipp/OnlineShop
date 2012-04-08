//
//  SettlementCenterCell8.m
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-4-7.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "SettlementCenterCell40.h"

@implementation SettlementCenterCell40

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
        TGLabel * label00 = [[[TGLabel alloc] initWithFrame:CGRectMake(self.indentationLevel * self.indentationWidth, 0, 180, 30)] autorelease];
        label00.text = @"全场购物满59元免运费";
        [self addSubview:label00];
        
        label01 = [[[TGLabel alloc] initWithFrame:CGRectMake(self.indentationLevel * self.indentationWidth + label00.frame.size.width, label00.frame.origin.y, 320, label00.frame.size.height)] autorelease];
        [self addSubview:label01];
        
        int fontSize = 13;
        label00.font = [UIFont systemFontOfSize:fontSize];
        label01.font = [UIFont systemFontOfSize:fontSize];
        
        float alpha = 0.7;
        label00.alpha = alpha;
        label01.alpha = alpha;
        
        label00.textColor = [UIColor redColor];
        label01.textColor = [UIColor redColor];
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
    //label01.text = @"北京二库";
}

@end
