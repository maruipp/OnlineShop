//
//  RootTabBarController.m
//  YangMeiFXG
//
//  Created by  on 11-11-5.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "RootTabBarController.h"
#import <QuartzCore/QuartzCore.h>


@implementation RootTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


#pragma mark - TableBar delegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
//    [self performSelector:@selector(selectIndex) withObject:nil afterDelay:0.03];
}


-(void)selectIndex{
    
//    if ( self.selectedIndex > currentIndex  ) {
//        CATransition * animation = [CATransition animation];
//        [animation setDuration:0.5f];
//        [animation setType:kCATransitionPush];
//        [animation setFillMode:kCAFillModeForwards];
//        [animation setSubtype:kCATransitionFromRight];
//        [[self.selectedViewController.view layer] addAnimation:animation forKey:@"transitionViewAnimation1"];
//        
//    }else if( self.selectedIndex < currentIndex ){
//        CATransition * animation = [CATransition animation];
//        [animation setDuration:0.5f];
//        [animation setType:kCATransitionPush];
//        [animation setSubtype:kCATransitionFromLeft];
//        [animation setTimingFunction:UIViewAnimationCurveEaseInOut];
//        [animation setFillMode:kCAFillModeForwards];
//        [[self.tabBar layer] removeAllAnimations];
//        [[self.selectedViewController.view layer] addAnimation:animation forKey:@"transitionViewAnimation2"];
//        
//    }
//    currentIndex = self.selectedIndex;
    
}





#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
 
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    currentIndex = 0;
}


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
