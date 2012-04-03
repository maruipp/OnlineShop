//
//  ProductDetailController.m
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-4-2.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "ProductDetailController.h"

@implementation ProductDetailController

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
        detailTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 367) style:UITableViewStylePlain];
        detailTableView.dataSource = self;
        detailTableView.delegate = self;
        [self.view addSubview:detailTableView];
    }
    return self;
}


- (void) readData:(int) index
{
    if (!dataArray) {
        [dataArray release];
        dataArray = nil;
    }
    dataArray = [[NSMutableArray alloc] init];
    [super readData:index];
    NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
    for (int i = 0; i < 10; i++) {
        [dic removeAllObjects];
        [dic setObject:@"IMG_0395.PNG" forKey:@"imageurl"];
        [dic setObject:[NSNumber numberWithInt:12] forKey:@"id"];
        [dic setObject:[NSNumber numberWithInt:199] forKey:@"price"];
        [dataArray addObject:dic];
    }
    [dic release];
    
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
 
    NSString * indentifier = [NSString stringWithFormat:@"cell%i",indexPath.row];
    Class cellClass = NSClassFromString([NSString stringWithFormat:@"ProductDetailLine%iCell",indexPath.row]);
    TGTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
    }

    if ([cell respondsToSelector:@selector(setDataDic:)]) {
        [cell setDataDic:nil];
    }
    
    //cell.textLabel.text = [dataArray objectAtIndex:indexPath.row];
    //cell.imageView.image = [UIImage imageNamed:@"IMG_0399.PNG"];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}
#pragma mark  tableview delegate

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSString * className = @"ChildCataController";
//    
//    [[NSUserDefaults standardUserDefaults] setObject:[dataArray objectAtIndex:indexPath.row] forKey:CURRENT_CONTROLLER_TITLE_KEY];
//    UIViewController * nextCtr = PAGECONTROLLER(className);//GenralInfoListController
//    //UIViewController * nextCtr = PAGECONTROLLER(@"ImageListController");
//    [self.navigationController pushViewController:nextCtr animated:YES];
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int height = 40;
    if (0 == indexPath.row) {
        height = 60;
    }
    else if(1 == indexPath.row)
    {
        height = 40;
    }
    else if(2 == indexPath.row)
    {
        height = 80;
    }
    else if(3 == indexPath.row)
    {
        height = 40;
    }
    else if(4 == indexPath.row)
    {
        height = 60;
    }
    return height;
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
