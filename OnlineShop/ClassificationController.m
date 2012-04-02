//
//  ClassificationController.m
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-3-28.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "ClassificationController.h"

@implementation ClassificationController

- (void) dealloc
{
    [dataArray release];
    [detailTableView release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self readData];
        // Custom initialization
        detailTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 367) style:UITableViewStylePlain];
        detailTableView.dataSource = self;
        detailTableView.delegate = self;
        [self.view addSubview:detailTableView];
    }
    return self;
}


#pragma mark --
#pragma mark  read data
- (void) readData
{
    dataArray = [[NSMutableArray arrayWithObjects:@"凡客热点",@"精品排行",@"新品上架",@"全场文胸吊带29",@"全棉免烫小方领衬衫68起",@"29元 青春多彩超炫邮差包",@"欧美风情情侣T恤 59元起",@"79起购林书豪款系列T恤",nil] retain];
    
}

#pragma mark --
#pragma mark  UISearchBarDelegate
- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSIndexPath * index = [detailTableView indexPathForSelectedRow];
    [detailTableView deselectRowAtIndexPath:index animated:NO];
}
#pragma mark --
#pragma mark  tableView datasource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * indentifier = @"cell";
    TGTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        cell = [[TGTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    cell.textLabel.text = [dataArray objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"IMG_0399.PNG"];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataArray count];
}
#pragma mark  tableview delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * className = @"ChildCataController";
    
    [[NSUserDefaults standardUserDefaults] setObject:[dataArray objectAtIndex:indexPath.row] forKey:CURRENT_CONTROLLER_TITLE_KEY];
    UIViewController * nextCtr = PAGECONTROLLER(className);//GenralInfoListController
    //UIViewController * nextCtr = PAGECONTROLLER(@"ImageListController");
    [self.navigationController pushViewController:nextCtr animated:YES];
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
