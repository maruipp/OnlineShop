//
//  ImageButton.m
//  ArtPad
//
//  Created by GodHope on 11-11-28.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "ImageButton.h"
#import "ImageStore.h"

@implementation ImageButton


-(id)initWithFrame:(CGRect)frame{
    if ((self = [super initWithFrame:frame])) {
//-- 第一步--图片下载监视器
        _receiver = [[ImageStoreReceiver alloc] init];

    }
    return self;
}

//--第二步－根据url获取图片
- (void)getImage:(NSString*)url{
    if (_imageUrl != url) {
        [_imageUrl release];
    }
    _imageUrl = [url copy];
    
    ImageStore *store = [ImageStore sharedStore];
    UIImage *image = [store getProfileImage:url delegate:_receiver];
    _receiver.imageContainer = self;
    [self setImage:image forState:UIControlStateNormal];
}


//--图片下载完成后更新显示的图片
-(void)updateImage:(UIImage *)image sender:(ImageStoreReceiver *)sender{
    [self setImage:image forState:UIControlStateNormal];
}

-(void)dealloc{
    CLog(@"imageButton release");
    _receiver.imageContainer = nil;
    ImageStore *store = [ImageStore sharedStore];
//    调用移出委托
    [store removeDelegate:_receiver forURL:_imageUrl];
    [_imageUrl release];
    [_receiver release];
    [super dealloc];
}

@end
