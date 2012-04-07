//
//  MoreController.m
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-3-28.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "MoreController.h"

@implementation MoreController

- (void) dealloc
{
    [detailTableView release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        detailTableView = [[TGTableView alloc] initWithFrame:RECT_TABBAR_NAVIGATIONBAR_STATUS style:UITableViewStyleGrouped];
        detailTableView.dataSource = self;
        detailTableView.delegate = self;
        [self.view addSubview:detailTableView];
    }
    return self;
}
#pragma mark --
#pragma mark  tableView datasource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * indentifier = @"cell";
    TGTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        cell = [[[TGTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier] autorelease];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    NSString * text = nil;
    switch (indexPath.section) {
        case 0:
            if (0 == indexPath.row) {
                text = @"最近浏览";
            }
            break;
        case 1:
            if (0 == indexPath.row) {
                text = @"意见反馈";
            }
            else if(1 == indexPath.row)
            {
                text = @"帮助";
            }
            else if(2 == indexPath.row)
            {
                text = @"设置";
            }
            break;
        case 2:
            if (0 == indexPath.row) {
                text = @"更多应用";
            }
            else if(1 == indexPath.row)
            {
                text = @"关于凡客";
            }
            break;
            
        default:
            break;
    }
    cell.textLabel.text = text;

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int rows = 0;
    switch (section) {
        case 0:
            rows = 1;
            break;
        case 1:
            rows = 3;
        case 2:
            rows = 2;
        default:
            break;
    }
    return rows;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
#pragma mark  tableview delegate 


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSString * className = @"ProductDetailController";
//    
//    [[NSUserDefaults standardUserDefaults] setObject:@"产品详情" forKey:CURRENT_CONTROLLER_TITLE_KEY];
//    UIViewController * nextCtr = PAGECONTROLLER(className);//GenralInfoListController
//    //UIViewController * nextCtr = PAGECONTROLLER(@"ImageListController");
//    [self.navigationController pushViewController:nextCtr animated:YES];
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
