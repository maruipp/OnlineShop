//
//  TGModuleHomeController.m
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-3-28.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "TGModuleHomeController.h"

@implementation TGModuleHomeController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSString * classStr = NSStringFromClass([self class]);
        CLog(@"%@", classStr);
        NSDictionary * configsDic = PLIST_CONFIGS;
        NSDictionary * myConfigDic = [configsDic objectForKey:classStr];
        //tabbar data
        NSDictionary * tabBarDic = [myConfigDic objectForKey:@"TabBar"];
        NSString * tabBarTitle = [tabBarDic objectForKey:@"Title"];
        NSString * tabBarImage = [tabBarDic objectForKey:@"Image"];
        NSNumber * tabBarTag = [tabBarDic objectForKey:@"Tag"];
        //navigation bar data
        NSDictionary * nvgDic = [myConfigDic objectForKey:@"NavigationBar"];
        NSString * nvgTitle = [nvgDic objectForKey:@"Title"];
        
        self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:tabBarTitle image:[UIImage imageNamed:tabBarImage] tag:[tabBarTag intValue]] autorelease];
        
        self.navigationItem.title = nvgTitle;
    }
    return self;
}

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
