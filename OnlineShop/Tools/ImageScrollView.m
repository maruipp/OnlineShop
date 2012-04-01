//
//  ImageScrollView.m
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-3-29.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "ImageScrollView.h"

@implementation ImageScrollView

- (void) dealloc
{
    //[detailScrollView release];
    [self endTimer];
    [pageControl release];
    [super dealloc];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
//        detailScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 320, frame.size.width, frame.size.height)];
//        detailScrollView.delegate = self;
//        [self addSubview:detailScrollView];
        
        //图片滚动控制
        pageControl  =   [[UIPageControl alloc] initWithFrame:CGRectMake(240, 192, 70, 13)];
        pageControl.hidesForSinglePage = YES;
        [pageControl addTarget:self action:@selector(pageControlTouchedDown:) forControlEvents:UIControlEventValueChanged];
        //[pageControl setUserInteractionEnabled:NO];
        [self addSubview:pageControl];
        autoScrollFlag  =   YES;
        //pageControl.backgroundColor =   [UIColor clearColor];
        //pageControl.alpha       = 0.5;
        
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator   = NO;
        
        //使scrollview每次只能翻一页
        [self setPagingEnabled:YES];
        
        self.backgroundColor    =   [UIColor blackColor];
        
    }
    return self;
}

- (void) setImages:(NSArray *) imageArray
{
    //填充滚动图片
    for (int i = 0; i < [imageArray count]; i++) {
        UIView * view = [imageArray objectAtIndex:i];
        view.frame = CGRectMake(320 * i, 0, 320, 128);
        //[view setUserInteractionEnabled:NO];
        [self addSubview:view];
    }
    int total = [imageArray count];
    //设置pagecontrol页数
    pageControl.numberOfPages   =  total;
    self.contentSize = CGSizeMake(320 * total, 128);
    pageControl.backgroundColor = [UIColor yellowColor];
    //[self bringSubviewToFront:self];
    [self startTimer];
}

#pragma mark - 
-(void) refresh
{
//    //重置数据
//    if (dataArray != nil) {
//        [dataArray release];
//        dataArray   =   nil;
//    }
    //结束计时器
    [self endTimer];
    
}

-(void) changePic
{
    
    int curPage = pageControl.currentPage;
    
    
    BOOL isAnimated = YES;
    if (curPage == (pageControl.numberOfPages - 1)) {
        pageControl.currentPage =   0;
        isAnimated  =   NO;
    }
    else
    {
        pageControl.currentPage +=  1;
    }
    
    //标识正在自动滚动图片
    autoScrollFlag = YES;
    [self setContentOffset:CGPointMake(320 * pageControl.currentPage, 0) animated:isAnimated];
    
    
}

//改变说明文字
-(void) changeText
{
//    captionLabel.text = [[dataArray objectAtIndex:pageControl.currentPage] objectForKey:@"title"];
}

#pragma mark - 响应pagecontrol点击事件
-(void) pageControlTouchedDown:(id) sender
{
    UIPageControl * pc = (UIPageControl *) sender;
    CLog(@"@@@@  %i", pc.currentPage);
    [self changePic];
    [self changeText];
}
#pragma mark -
#pragma mark        UIScrollViewDelegate Methods
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (timer != nil && !autoScrollFlag) {
        [self endTimer];
        CLog(@"关闭计时器");
    }
    
}

//滑动图片手指离开时调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //    if ([scrollView isKindOfClass:[UITableView class]]) {  
    //        return;  
    //    } 
    
    //    if (timer == nil) {
    //        timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(changePic) userInfo:nil repeats:YES];
    //        //autoScrollFlag  =   YES;
    //    }
    //开启计时器    
    [self startTimer];
    
    CGFloat pageWidth = self.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    NSInteger   pg = page;
    [pageControl setCurrentPage:pg];
    CGPoint offset = CGPointMake(320 * pageControl.currentPage, 0);
    CLog(@"%f contentOffset", scrollView.contentOffset.x);
    CLog(@"%d --", pageControl.currentPage);
    [scrollView setContentOffset:offset animated:YES];
    [self changeText];
}

//图片滚动结束时调用
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    //滚动开始时标识开始滚动，此时滚动结束了，标识结束滚动
    autoScrollFlag  =     NO;
    [self changeText];
}


//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
//{
//    autoScrollFlag  =     NO;
//   // CLog(@"scrollViewWillBeginDragging");
//}

#pragma mark - 管理timer
//开启计时器
-(void) startTimer
{
    if (timer == nil) {
        timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(changePic) userInfo:nil repeats:YES];
    }
}
//结束计时器
-(void) endTimer
{
    if (timer != nil) {
        [timer invalidate];
        timer = nil;
    }
    
}

@end
