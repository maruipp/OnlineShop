//
//  ImageListController.m
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-4-1.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "ImageListController.h"

@implementation ImageListController
@synthesize containerCell = _containerCell;
- (void) dealloc
{
    [_containerCell release];
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
    
    [self layout];
}

-(void)getReturnValue:(MRPNetwork *)sender obj:(NSDictionary *)obj
{
    [super getReturnValue:sender obj:obj];
    //[self layout];
}
#pragma mark -- layout
- (void) layout
{
    for (int i = 0; i < [dataArray count]; i++) {
        NSMutableDictionary * dic = [dataArray objectAtIndex:i];
        NSString * imageurl = [dic objectForKey:@"imageurl"];
        NSNumber * price = [dic objectForKey:@"price"];
        ZKQuickButtonView * imageBtn = [[[ZKQuickButtonView alloc] init] autorelease];
        [imageBtn setImage:imageurl andTitle:[NSString stringWithFormat:@"%@",price]];
        int xOffset = 0;
        if (0 == i % 2) {
            xOffset = 13;
        }
        else
        {
            xOffset = 165;
        }
        imageBtn.frame = CGRectMake(xOffset, 8 + i / 2 * 184, 140, 174);
        [_containerCell addSubview:imageBtn];
    }
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
    self.containerCell = cell;
    //cell.textLabel.text = [dataArray objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float rowCount = [dataArray count] / 2.0;
    if (rowCount > [dataArray count] / 2) {
        rowCount++;
    }
    int height = rowCount * 184;
    return height;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self layout];
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
