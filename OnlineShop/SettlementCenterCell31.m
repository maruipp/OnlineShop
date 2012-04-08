//
//  SettlementCenterCell6.m
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-4-7.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "SettlementCenterCell31.h"

@implementation SettlementCenterCell31

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
        self.indentationLevel = 0;
        imageBtn = [[[ImageButton alloc] initWithFrame:CGRectMake(self.indentationLevel * self.indentationWidth, 5, 80, 80)] autorelease];
        [self addSubview:imageBtn];
        
        //line 0 
        label00 = [[[TGLabel alloc] initWithFrame:CGRectMake(self.indentationLevel * self.indentationWidth + 100, 0, 320, 30)] autorelease];
        label00.text = @"经典白搭纯色低帮";
        [self addSubview:label00];
        
        //line 1
        TGLabel * label10 = [[[TGLabel alloc] initWithFrame:CGRectMake(self.indentationLevel * self.indentationWidth + 100, label00.frame.size.height + label00.frame.origin.y, 50, 20)] autorelease];
        label10.text = @"尺码：";
        [self addSubview:label10];
        
        
        label11 = [[[TGLabel alloc] initWithFrame:CGRectMake(self.indentationLevel * self.indentationWidth + label10.frame.size.width, label00.frame.size.height + label00.frame.origin.y, 40, 20)] autorelease];
        [self addSubview:label11];
        
        TGLabel * label12 = [[[TGLabel alloc] initWithFrame:CGRectMake(self.indentationLevel * self.indentationWidth + 180, label00.frame.size.height + label00.frame.origin.y, 50, 20)] autorelease];
        label12.text = @"颜色:";
        [self addSubview:label12];
        
        
        label13 = [[[TGLabel alloc] initWithFrame:CGRectMake(self.indentationLevel * self.indentationWidth + label12.frame.size.width, label00.frame.size.height + label00.frame.origin.y, 40, 20)] autorelease];
        [self addSubview:label13];
        
        //line 2
        TGLabel * label20 = [[[TGLabel alloc] initWithFrame:CGRectMake(self.indentationLevel * self.indentationWidth + 100, label10.frame.size.height + label10.frame.origin.y, 50, 20)] autorelease];
        label20.text = @"数量：";
        [self addSubview:label20];
        
        
        label21 = [[[TGLabel alloc] initWithFrame:CGRectMake(self.indentationLevel * self.indentationWidth + label20.frame.size.width, label10.frame.size.height + label10.frame.origin.y, 40, 20)] autorelease];
        [self addSubview:label21];
        
        
        //line 3
        TGLabel * label30 = [[[TGLabel alloc] initWithFrame:CGRectMake(self.indentationLevel * self.indentationWidth + 100, label20.frame.size.height + label20.frame.origin.y, 50, 20)] autorelease];
        label30.text = @"单价：";
        [self addSubview:label30];
        
        
        label31 = [[[TGLabel alloc] initWithFrame:CGRectMake(self.indentationLevel * self.indentationWidth + label30.frame.size.width, label20.frame.size.height + label20.frame.origin.y, 40, 20)] autorelease];
        [self addSubview:label31];
        
        TGLabel * label32 = [[[TGLabel alloc] initWithFrame:CGRectMake(self.indentationLevel * self.indentationWidth + 180, label20.frame.size.height + label20.frame.origin.y, 50, 20)] autorelease];
        label32.text = @"小计:";
        [self addSubview:label32];
        
        
        label33 = [[[TGLabel alloc] initWithFrame:CGRectMake(self.indentationLevel * self.indentationWidth + label32.frame.size.width, label20.frame.size.height + label20.frame.origin.y, 40, 20)] autorelease];
        [self addSubview:label33];
        
        
        
        int fontSize = 13;
        label10.font = [UIFont systemFontOfSize:fontSize];
        label11.font = [UIFont systemFontOfSize:fontSize];
        label12.font = [UIFont systemFontOfSize:fontSize];
        label13.font = [UIFont systemFontOfSize:fontSize];
        label20.font = [UIFont systemFontOfSize:fontSize];
        label21.font = [UIFont systemFontOfSize:fontSize];
        label30.font = [UIFont systemFontOfSize:fontSize];
        label31.font = [UIFont systemFontOfSize:fontSize];
        label32.font = [UIFont systemFontOfSize:fontSize];
        label33.font = [UIFont systemFontOfSize:fontSize];
        
        float alpha = 0.7;
        label10.alpha = alpha;
        label11.alpha = alpha;
        label12.alpha = alpha;
        label13.alpha = alpha;
        label20.alpha = alpha;
        label21.alpha = alpha;
        label30.alpha = alpha;
        label31.alpha = alpha;
        label32.alpha = alpha;
        label33.alpha = alpha;
        
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
//label01.text = @"北京二库";
}

@end
