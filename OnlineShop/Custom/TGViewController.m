//
//  TGViewController.m
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-3-28.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "TGViewController.h"

@implementation TGViewController

- (void) dealloc
{
    [progress_ removeFromSuperview];  
    [progress_ release];  
    [dataArray release];
    [super dealloc];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSString * nvgTitle = [[NSUserDefaults standardUserDefaults] objectForKey:CURRENT_CONTROLLER_TITLE_KEY];
        self.navigationItem.title = nvgTitle;
        [self readData:0];
    }
    return self;
}

- (void) readData:(int) index
{
    [self initProgressHD];
    network = [[MRPNetwork alloc] initWithTarget:self action:@selector(getReturnValue:obj:)];
}

-(void)getReturnValue:(MRPNetwork *)sender obj:(NSDictionary *)obj
{
    [self hiddenProgress];
    //若网络请求已经返回，则将network置为nil（因为此时network已被释放，其已成为野指针）
    network = nil;
    
    CLog(@"getReturnValue");
    //判断是否出错
    if (sender.hasError||obj==nil) {
        [sender alert];
        return;
    }
}

#pragma mark - 状态条
-(void)initProgressHD{
    
    //    progressView = [[[UIView alloc] initWithFrame:COMMON_DETAIL_VIEW_RECT] autorelease];
    //    [self.view addSubview:progressView];
    //progressView.hidden = YES;
    //progressView.backgroundColor = [UIColor yellowColor];
    
    //[self.view bringSubviewToFront:progressView];
    progress_ = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:progress_];
    progress_.delegate = self;
    //[progressView bringSubviewToFront:progress_];  
    [progress_ show:YES];  
}
#pragma mark - MBProgressHD delegate methods
- (void)hudWasHidden:(MBProgressHUD *)hud   
{  
    CLog(@"Hud: %@", hud);  
    // Remove HUD from screen when the HUD was hidded  
    [progress_ removeFromSuperview];  
    [progress_ release];  
    progress_ = nil;  
    
    //    [progressView removeFromSuperview];
    //    progressView = nil;
}  


-(void)hiddenProgress{
    if (progress_)   
    {  
        [progress_ removeFromSuperview];  
        [progress_ release];  
        progress_ = nil;  
        
        //        [progressView removeFromSuperview];
        //        progressView = nil;
    }  
}

#pragma mark - 页面切换时停止网络请求
- (void) viewDidDisappear:(BOOL)animated
{
    [network stopHttpRequest];
}


#pragma mark -
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
