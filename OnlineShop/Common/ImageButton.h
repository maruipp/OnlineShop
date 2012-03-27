//
//  ImageButton.h
//  ArtPad
//
//  Created by GodHope on 11-11-28.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageStoreReceiver.h"

@interface ImageButton : UIButton{
    ImageStoreReceiver*     _receiver;
    NSString*               _imageUrl;
}


- (void)getImage:(NSString*)url;

@end
