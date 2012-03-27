//
//  CommonRadioBox.m
//  ZhongKeBeiRuan
//
//  Created by 瑞鹏 马 on 12-3-6.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "CommonRadioBox.h"
#define RADIOBOX_WIDTH 30
@implementation CommonRadioBox
@synthesize aZone = _aZone;
@synthesize bZone = _bZone;
@synthesize aZoneLabel = _aZoneLabel;
@synthesize bZoneLabel = _bZoneLabel;
@synthesize curSelZone = _curSelZone;
- (void) dealloc
{
    
    [_aZoneLabel release];
    [_bZoneLabel release];
    [super dealloc];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _aZone = [UIButton buttonWithType:UIButtonTypeCustom];
        _bZone = [UIButton buttonWithType:UIButtonTypeCustom];
        _aZone.frame = CGRectMake(frame.size.width / 4 - RADIOBOX_WIDTH ,frame.size.height / 2 - RADIOBOX_WIDTH / 2,RADIOBOX_WIDTH,RADIOBOX_WIDTH);
        _bZone.frame = CGRectMake(frame.size.width * 3 / 4 - RADIOBOX_WIDTH ,frame.size.height / 2 - RADIOBOX_WIDTH / 2,RADIOBOX_WIDTH,RADIOBOX_WIDTH);
        [_aZone setImage:[UIImage imageNamed:@"yes_sel.png"] forState:UIControlStateNormal];
        _curSelZone = _aZone.tag;
        [_bZone setImage:[UIImage imageNamed:@"no_sel.png"] forState:UIControlStateNormal];
        _aZone.tag = 0;
        _bZone.tag = 1;
        [_aZone addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_bZone addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_aZone];
        [self addSubview:_bZone];
        
        _aZoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width / 4 ,frame.size.height / 2 - RADIOBOX_WIDTH / 2,frame.size.width / 4,RADIOBOX_WIDTH)];
        [self addSubview:_aZoneLabel];
        
        _bZoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width * 3 / 4 ,frame.size.height / 2 - RADIOBOX_WIDTH / 2,frame.size.width / 4,RADIOBOX_WIDTH)];
        [self addSubview:_bZoneLabel];
    }
    return self;
}

- (void) setAZoneTitle:(NSString *)aZoneStr andBZoneTitle:(NSString *)bZoneStr
{
    _aZoneLabel.text = aZoneStr;
    _bZoneLabel.text = bZoneStr;
}

- (void) buttonClicked:(UIButton *) sender
{
    [_aZone setImage:[UIImage imageNamed:@"no_sel.png"] forState:UIControlStateNormal];
    [_bZone setImage:[UIImage imageNamed:@"no_sel.png"] forState:UIControlStateNormal];
    [sender setImage:[UIImage imageNamed:@"yes_sel.png"] forState:UIControlStateNormal];
    _curSelZone = sender.tag;
}

- (void) setSelectZoneOfIndex:(int) index
{
    if (index > 1 || index < 0) {
        CLog(@"单选框索引错误");
    }
    _curSelZone = index;
    if (0 == _curSelZone) {
        [_aZone setImage:[UIImage imageNamed:@"yes_sel.png"] forState:UIControlStateNormal];
        [_bZone setImage:[UIImage imageNamed:@"no_sel.png"] forState:UIControlStateNormal];
        
    }
    else if(1 == _curSelZone)
    {
        [_aZone setImage:[UIImage imageNamed:@"no_sel.png"] forState:UIControlStateNormal];
        [_bZone setImage:[UIImage imageNamed:@"yes_sel.png"] forState:UIControlStateNormal];
    }
}

@end
