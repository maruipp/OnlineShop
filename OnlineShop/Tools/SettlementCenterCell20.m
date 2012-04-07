//
//  SettlementCenterCell4.m
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-4-7.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "SettlementCenterCell20.h"

@implementation SettlementCenterCell20

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
        TGLabel * label00 = [[[TGLabel alloc] initWithFrame:CGRectMake(self.indentationLevel * self.indentationWidth, 0, 60, 40)] autorelease];
        label00.text = @"其他：";
        [self addSubview:label00];
        
        label01 = [[[TGLabel alloc] initWithFrame:CGRectMake(self.indentationLevel * self.indentationWidth + label00.frame.size.width, label00.frame.origin.y, 320, label00.frame.size.height)] autorelease];
        [self addSubview:label01];
        
        int fontSize = 13;
        label01.font = [UIFont systemFontOfSize:fontSize];
        
        float alpha = 0.7;
        label01.alpha = alpha;
        
        label01.textColor = [UIColor blueColor];
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
    label01.text = @"未填写发票｜未留言";
}

@end
