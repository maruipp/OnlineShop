//
//  SettlementCenterController.m
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-4-7.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "SettlementCenterController.h"

@interface SettlementCenterController ()

@end

@implementation SettlementCenterController

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
#pragma mark  tableView datasource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * indentifier = [NSString stringWithFormat:@"cell%i%i",indexPath.section,indexPath.row];
    CLog([NSString stringWithFormat:@"SettlementCenterCell%i%i",indexPath.section,indexPath.row]);
    Class cellClass = NSClassFromString([NSString stringWithFormat:@"SettlementCenterCell%i%i",indexPath.section,indexPath.row]);
    TGTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        cell = [[[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier] autorelease];
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
    int rows = 0;
    switch (section) {
        case 0:
            rows = 3;
            break;
        case 1:
            rows = 1;
            break; 
        case 2:
            rows = 1;
            break; 
        case 3:
            rows = 3;
            break; 
        case 4:
            rows = 1;
            break; 
        default:
            break;
    }
    return rows;
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int height = 100;
    
    
    if (0 == indexPath.section) {
        if (0 == indexPath.row) {
            height = 100;
        }
        else if(1 == indexPath.row)
        {
            height = 80;
        }
        else if(2 == indexPath.row)
        {
            height = 80;
        }
    }
    else if (1 == indexPath.section){
        height = 80;
    }
    else if (2 == indexPath.section){
        height = 40;
    }
    else if (3 == indexPath.section){
        if (0 == indexPath.row) {
            height = 40;
        }
        else if(1 == indexPath.row)
        {
            height = 80;
        }
        else if(2 == indexPath.row)
        {
            height = 100;
        }
    }
    return height;
}
#pragma mark - 

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
