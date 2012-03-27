//
//  ImageDownloader.h
//  ArtPad
//
//  Created by zhaoxy on 11-11-20.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageDownloader : NSObject{
    id                  delegate;
    NSString*           requestURL;
	NSURLConnection*    connection;
	NSMutableData*      buf;
    int                 statusCode;
}

@property (nonatomic, readonly) NSMutableData* buf;
@property (nonatomic, assign) int statusCode;
@property (nonatomic, copy) NSString* requestURL;

- (id)initWithDelegate:(id)aDelegate;
- (void)get:(NSString*)URL;

- (void)TFConnectionDidFailWithError:(NSError*)error;
- (void)TFConnectionDidFinishLoading:(NSString*)content;

@end
