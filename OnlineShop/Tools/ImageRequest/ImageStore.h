//
//  ImageStore.h
//  ArtPad
//
//  Created by GodHope on 11-11-20.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageStore : NSObject{
    NSMutableDictionary *cacheImages;
    NSMutableDictionary *delegates;
    NSMutableDictionary *pending;
}

+(ImageStore *)sharedStore;
- (UIImage*)getProfileImage:(NSString*)url delegate:(id)delegate;
- (void)removeDelegate:(id)delegate forURL:(NSString*)key;
- (void)releaseImage:(NSString*)url;
- (void)didReceiveMemoryWarning;

@end
