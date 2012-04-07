//
//  GenralInfoListController.m
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-4-1.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "GenralInfoListController.h"

@implementation GenralInfoListController
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
        detailTableView = [[UITableView alloc] initWithFrame:RECT_TABBAR_NAVIGATIONBAR_STATUS style:UITableViewStylePlain];
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

-(void)getReturnValue:(MRPNetwork *)sender obj:(NSDictionary *)obj
{
    [super getReturnValue:sender obj:obj];

}

#pragma mark --
#pragma mark  tableView datasource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * indentifier = @"cell";
    GeneralInfoCell * cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        cell = [[GeneralInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //cell.textLabel.text = [dataArray objectAtIndex:indexPath.row];
    [cell setDataDic:nil];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 11;
}
#pragma mark  tableview delegate 

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float rowCount = [dataArray count] / 2.0;
    if (rowCount > [dataArray count] / 2) {
        rowCount++;
    }
    int height = rowCount * 184;
    return 90;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * className = @"ProductDetailController";
    
    [[NSUserDefaults standardUserDefaults] setObject:@"产品详情" forKey:CURRENT_CONTROLLER_TITLE_KEY];
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

#pragma mark --
#pragma mark  UISearchBarDelegate
- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSIndexPath * index = [detailTableView indexPathForSelectedRow];
    [detailTableView deselectRowAtIndexPath:index animated:NO];
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
