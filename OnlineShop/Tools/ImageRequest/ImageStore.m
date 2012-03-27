//
//  ImageStore.m
//  ArtPad
//
//  Created by GodHope on 11-11-20.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "ImageStore.h"
#import "ImageDownloader.h"
#import "ServerAddrDefine.h"

#define MAX_CONNECTION 5

static UIImage *sProfileImage = nil;
static ImageStore *instance = nil;

@interface ImageStore(Private)
- (void)saveImage:(NSData*)buf forURL:(NSString*)url;
- (UIImage*)getImageFromLocal:(NSString*)url;
+ (UIImage*)defaultProfileImage;
@end

@implementation ImageStore

#pragma mark - Single-instance

+(ImageStore *)sharedStore{
    if (!instance) {
        instance = [[ImageStore alloc] init];
    }
    return instance;
}

#pragma mark - Initial and release

-(id)init{
    if ((self = [super init])) {
        cacheImages = [[NSMutableDictionary alloc] init];
        pending = [[NSMutableDictionary alloc] init];
        delegates = [[NSMutableDictionary alloc] init];
    }
    return self;
}

-(void)dealloc{
    [cacheImages release];
    [pending release];
    [delegates release];
    [super dealloc];
}

#pragma mark - Get image
-(UIImage *)getImageFromLocal:(NSString *)url{
    NSString *temp = [url stringByReplacingOccurrencesOfString:SERVER_PREFIX withString:@""];
    NSString *imageName = [temp stringByReplacingOccurrencesOfString:@"/" withString:@""];
    
    NSArray *_cachePaths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *_cacheDirectory = [_cachePaths objectAtIndex:0]; 
    NSString *imagePath = [_cacheDirectory stringByAppendingPathComponent:imageName];

    imagePath = [imagePath stringByAppendingString:@".jpg"];
    
    CLog(@"imagePath:%@",url);
    UIImage *image;
    if ([[NSFileManager defaultManager] fileExistsAtPath:imagePath]) {
        image = [UIImage imageWithContentsOfFile:imagePath];
    }else{
        image = nil;
    }
    return image;
}
- (void)getPendingImage:(ImageDownloader*)sender{
    [pending removeObjectForKey:sender.requestURL];
    
    NSArray *keys = [pending allKeys];
    
    for (NSString *url in keys) {
        ImageDownloader *dl = [pending objectForKey:url];
        NSMutableArray *arr = [delegates objectForKey:url];
        if (arr == nil) {
            [pending removeObjectForKey:url];
        }else if ([arr count] == 0) {
            [delegates removeObjectForKey:url];
            [pending removeObjectForKey:url];
        }else {
            if (dl.requestURL == nil) {
                [dl get:url];
                break;
            }
        }
    }
}

- (UIImage*)getProfileImage:(NSString*)url delegate:(id)delegate{
    if (![url isKindOfClass:[NSString class]]) {
        return [ImageStore defaultProfileImage];
    }
    if (!delegate) {
        NSAssert(delegate==nil, @"image receiver not init");
    }
    UIImage *cacheImage = [cacheImages objectForKey:url];
    if (cacheImage) {
        return cacheImage;
    }
    cacheImage = [self getImageFromLocal:url];
    if (cacheImage) {
        [cacheImages setObject:cacheImage forKey:url];
        return cacheImage;
    }
    ImageDownloader *dl = [pending objectForKey:url];
    if (dl == nil) {
        dl = [[[ImageDownloader alloc] initWithDelegate:self] autorelease];
        [pending setObject:dl forKey:url];
    }
    
    NSMutableArray *arr = [delegates objectForKey:url];
    if (arr) {
        [arr addObject:delegate];
    }else {
        [delegates setObject:[NSMutableArray arrayWithObject:delegate] forKey:url];
    }
    if ([pending count] <= MAX_CONNECTION && dl.requestURL == nil) {
        [dl get:url];
    }
    
    return [ImageStore defaultProfileImage];
}

- (void)saveImage:(NSData*)buf forURL:(NSString*)url{
    
    
    NSString *temp = [url stringByReplacingOccurrencesOfString:SERVER_PREFIX withString:@""];
    NSString *imageName = [temp stringByReplacingOccurrencesOfString:@"/" withString:@""];
    
    NSArray *_cachePaths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *_cacheDirectory = [_cachePaths objectAtIndex:0]; 
    NSString *imagePath = [_cacheDirectory stringByAppendingPathComponent:imageName];
   imagePath = [imagePath stringByAppendingString:@".jpg"];
    
    [buf writeToFile:imagePath atomically:YES];
}

+(UIImage*)defaultProfileImage
{
    if (sProfileImage == nil) {
        sProfileImage = [[UIImage imageNamed:@"profileImage.png"] retain];
    }
    return sProfileImage;
}

#pragma mark - ImageDownloaderDelegate
- (void)imageDownloaderDidSucceed:(ImageDownloader*)sender
{
    
    CLog(@"image download succeed ");
    
	UIImage *image = [UIImage imageWithData:sender.buf];
    
    if (image) {
        [self saveImage:sender.buf forURL:sender.requestURL];
        
        NSMutableArray *arr = [delegates objectForKey:sender.requestURL];
        if (arr) {
            for (id delegate in arr) {
                if ([delegate respondsToSelector:@selector(profileImageDidGetNewImage:)]) {
                    [delegate performSelector:@selector(profileImageDidGetNewImage:) withObject:image];
                }
            }
            [delegates removeObjectForKey:sender.requestURL];
        }
        [cacheImages setObject:image forKey:sender.requestURL];
    }
    
    [self getPendingImage:sender];
}
- (void)imageDownloaderDidFail:(ImageDownloader*)sender error:(NSError*)error
{
    [self getPendingImage:sender];
}

- (void)removeDelegate:(id)delegate forURL:(NSString*)key{
    NSMutableArray *arr = [delegates objectForKey:key];
    if (arr) {
        [arr removeObject:delegate];
        if ([arr count] == 0) {
            [delegates removeObjectForKey:key];
        }
    }
}

- (void)releaseImage:(NSString*)url{
    UIImage* image = [cacheImages objectForKey:url];    
    if (image) {
        [cacheImages removeObjectForKey:url];
    }
}

- (void)didReceiveMemoryWarning{
    NSMutableArray *array = [[[NSMutableArray alloc] init] autorelease];
    for (id key in cacheImages) {
        UIImage* image = [cacheImages objectForKey:key];
        if (image.retainCount == 1) {
            CLog(@"Release image %@", image);
            [array addObject:key];
        }
    }
    [cacheImages removeObjectsForKeys:array];
}

@end
