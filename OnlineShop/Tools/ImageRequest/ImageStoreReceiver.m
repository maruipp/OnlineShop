//
//  ImageDownloader.h
//  ArtPad
//
//  Created by GodHope on 11-11-20.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "ImageStoreReceiver.h"


@implementation ImageStoreReceiver

@synthesize imageContainer;

- (void)dealloc
{
    imageContainer = nil;
    [super dealloc];
}

- (void)profileImageDidGetNewImage:(UIImage*)image
{
    if (imageContainer) {
        if ([imageContainer respondsToSelector:@selector(updateImage:sender:)]) {
            [imageContainer performSelector:@selector(updateImage:sender:) withObject:image withObject:self];
        }
    }
}

@end
