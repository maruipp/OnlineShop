//
//  ColorfulCataListController.m
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-4-2.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "ColorfulCataListController.h"

@implementation ColorfulCataListController

- (void) dealloc
{
    //[dataArray release];
    [detailTableView release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
//        [self readData:0];
        // Custom initialization
        detailTableView = [[UITableView alloc] initWithFrame:RECT_TABBAR_NAVIGATIONBAR_STATUS style:UITableViewStylePlain];
        detailTableView.dataSource = self;
        detailTableView.delegate = self;
        [self.view addSubview:detailTableView];
    }
    return self;
}

#pragma mark --
#pragma mark  read data
- (void) readData:(int)index
{
    dataArray = [[NSMutableArray arrayWithObjects:@"VT(男款)",@"鞋（女款）",@"鞋（男款）",@"衬衫",@"卫衣",@"童装",@"日韩女装",@"欧美女装",@"针织衫（女款）",nil] retain];
    
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
    ColorfulCataListCell * cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        cell = [[ColorfulCataListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
    }
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    cell.textLabel.text = [dataArray objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataArray count];
}
#pragma mark  tableview delegate
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    return nil;
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 160;
//}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[NSUserDefaults standardUserDefaults] setObject:[dataArray objectAtIndex:indexPath.row] forKey:CURRENT_CONTROLLER_TITLE_KEY];
    
    NSString * className = @"GenralInfoListController";
    
    UIViewController * nextCtr = PAGECONTROLLER(className);
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
