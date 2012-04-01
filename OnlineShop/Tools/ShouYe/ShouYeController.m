//
//  ShouYeController.m
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-3-27.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "ShouYeController.h"

@implementation ShouYeController

- (void) dealloc
{
    [dataArray release];
    [detailTableView release];
    [detailScrollView release];
    [super dealloc];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        [self readData];
        UIImageView * image = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"scroll1.jpg"]] autorelease];
        UIImageView * image1 = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"scroll2.jpg"]] autorelease];
        UIImageView * image2 = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"scroll3.jpg"]] autorelease];
        NSMutableArray * arr = [NSMutableArray arrayWithObjects:image,image1,image2, nil];
        
        
        detailScrollView = [[ImageScrollView alloc] initWithFrame:CGRectMake(0, 40, 320, 128)];
        [self.view addSubview:detailScrollView];
        [detailScrollView setImages:arr];
        [self.view bringSubviewToFront:detailScrollView];
        
        detailTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 367) style:UITableViewStylePlain];
        detailTableView.dataSource = self;
        detailTableView.delegate = self;
        [self.view addSubview:detailTableView];
        
        UISearchBar * searchBar = [[[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 40)] autorelease];
        //searchBar.showsCancelButton = YES;
        searchBar.tintColor = [UIColor colorWithRed:96/255.0 green:96/255.0 blue:96/255.0 alpha:1.0];
        searchBar.delegate = self;
        UIView * header = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 168)] autorelease];
        [header addSubview:searchBar];
        [header addSubview:detailScrollView];
        detailTableView.tableHeaderView = header;
    }
    return self;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:YES animated:YES];
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
}
#pragma mark --
#pragma mark  read data
- (void) readData
{
    dataArray = [[NSMutableArray arrayWithObjects:@"凡客热点",@"精品排行",@"新品上架",@"全场文胸吊带29",@"全棉免烫小方领衬衫",nil] retain];
    
}
#pragma mark --
#pragma mark  tableView datasource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * indentifier = @"cell";
    TGTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        cell = [[TGTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
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
    UIViewController * nextCtr = PAGECONTROLLER(@"GenralInfoListController");//GenralInfoListController
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
