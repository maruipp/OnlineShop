//
//  SettlementCenterCell0.m
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-4-7.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "SettlementCenterCell00.h"

@implementation SettlementCenterCell00
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
        label00.text = @"收货人信息";
        [self addSubview:label00];
        
        //line 1
        TGLabel * label10 = [[[TGLabel alloc] initWithFrame:CGRectMake(self.indentationLevel * self.indentationWidth, label00.frame.size.height + label00.frame.origin.y, 120, 20)] autorelease];
        label10.text = @"收货人姓名：";
        [self addSubview:label10];
        
         
        label11 = [[[TGLabel alloc] initWithFrame:CGRectMake(self.indentationLevel * self.indentationWidth + label10.frame.size.width, label00.frame.size.height + label00.frame.origin.y, 320, 20)] autorelease];
        [self addSubview:label11];
        
        //line 2
        TGLabel * label20 = [[[TGLabel alloc] initWithFrame:CGRectMake(self.indentationLevel * self.indentationWidth, label10.frame.size.height + label11.frame.origin.y, 90, 20)] autorelease];
        label20.text = @"手机号码：";
        [self addSubview:label20];
        
        label21 = [[[TGLabel alloc] initWithFrame:CGRectMake(self.indentationLevel * self.indentationWidth  + label20.frame.size.width, label11.frame.size.height + label11.frame.origin.y, 320, 20)] autorelease];
        [self addSubview:label21];
        
        //line 3
        TGLabel * label30 = [[[TGLabel alloc] initWithFrame:CGRectMake(self.indentationLevel * self.indentationWidth, label20.frame.size.height + label20.frame.origin.y, 50, 20)] autorelease];
        label30.text = @"地址：";
        [self addSubview:label30];
        
        label31 = [[[TGLabel alloc] initWithFrame:CGRectMake(self.indentationLevel * self.indentationWidth + label30.frame.size.width, label20.frame.size.height + label20.frame.origin.y, 320, 20)] autorelease];
        [self addSubview:label31];
        
        int fontSize = 13;
        label10.font = [UIFont systemFontOfSize:fontSize];
        label11.font = [UIFont systemFontOfSize:fontSize];
        label20.font = [UIFont systemFontOfSize:fontSize];
        label21.font = [UIFont systemFontOfSize:fontSize];
        label30.font = [UIFont systemFontOfSize:fontSize];
        label31.font = [UIFont systemFontOfSize:fontSize];
        
        float alpha = 0.7;
        label10.alpha = alpha;
        label11.alpha = alpha;
        label20.alpha = alpha;
        label21.alpha = alpha;
        label30.alpha = alpha;
        label31.alpha = alpha;
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
