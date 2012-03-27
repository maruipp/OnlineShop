//
//  ImageDownloader.m
//  ArtPad
//
//  Created by GodHope on 11-11-20.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "ImageDownloader.h"

#define NETWORK_TIMEOUT 120.0

@interface NSObject (ImageDownloaderDelegate)
- (void)imageDownloaderDidSucceed:(ImageDownloader*)sender;
- (void)imageDownloaderDidFail:(ImageDownloader*)sender error:(NSError*)error;
@end

@implementation ImageDownloader

@synthesize buf;
@synthesize statusCode;
@synthesize requestURL;

#pragma mark - initial and dealloc

- (id)initWithDelegate:(id)aDelegate
{
	self = [super init];
	delegate = aDelegate;
    statusCode = 0;
	return self;
}

- (void)dealloc
{
    [requestURL release];
	[connection release];
	[buf release];
	[super dealloc];
}

#pragma mark - image download

- (void)get:(NSString*)aURL
{
    [connection release];
	[buf release];
    statusCode = 0;
    
    self.requestURL = aURL;
    
    NSString *URL = (NSString*)CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)aURL, (CFStringRef)@"%", NULL, kCFStringEncodingUTF8);
	
	[URL autorelease];
    CLog(@"%@", URL);
	
	NSURL *finalURL = [NSURL URLWithString:URL];
	NSMutableURLRequest* req = [NSMutableURLRequest requestWithURL:finalURL
                                                       cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                                   timeoutInterval:NETWORK_TIMEOUT];
        
  	buf = [[NSMutableData data] retain];
	connection = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)cancel
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;    
    if (connection) {
        [connection cancel];
        [connection autorelease];
        connection = nil;
    }
}

- (void)connection:(NSURLConnection *)aConnection didReceiveResponse:(NSURLResponse *)aResponse
{
    NSHTTPURLResponse *resp = (NSHTTPURLResponse*)aResponse;
    if (resp) {
        statusCode = resp.statusCode;
        //CLog(@"Response: %d", statusCode);
    }
	[buf setLength:0];
}

- (void)connection:(NSURLConnection *)aConn didReceiveData:(NSData *)data
{
	[buf appendData:data];
}

- (void)connection:(NSURLConnection *)aConn didFailWithError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
	[connection autorelease];
	connection = nil;
	[buf autorelease];
	buf = nil;
    
    NSString* msg = [NSString stringWithFormat:@"Error: %@ %@",
                     [error localizedDescription],
                     [[error userInfo] objectForKey:NSErrorFailingURLStringKey]];
    
    CLog(@"Connection failed: %@", msg);
    
    [self TFConnectionDidFailWithError:error];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)aConn
{
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    NSString* s = [[[NSString alloc] initWithData:buf encoding:NSUTF8StringEncoding] autorelease];
    //CLog(@"response: %@", s);
    [self TFConnectionDidFinishLoading:s];
    
    [connection autorelease];
    connection = nil;
    [buf autorelease];
    buf = nil;
}

- (void)TFConnectionDidFailWithError:(NSError*)error
{
    [delegate imageDownloaderDidFail:self error:error];
}   

- (void)TFConnectionDidFinishLoading:(NSString*)content
{
    if (statusCode == 200) {
        [delegate imageDownloaderDidSucceed:self];
    }
}

@end
