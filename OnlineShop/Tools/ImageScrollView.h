//
//  ImageScrollView.h
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-3-29.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageScrollView : UIScrollView <UIScrollViewDelegate>
{
    //UIScrollView    * detailScrollView;
    UIPageControl           *   pageControl;
    int                         currentPage;
    NSTimer                 *   timer;
    BOOL                        autoScrollFlag;    //标记自由滚动还是拖拽
   // NSMutableArray              * dataArray;
}

- (void) setImages:(NSArray *) imageArray;
//刷新数据
-(void) refresh;
//开启计时器
-(void) startTimer;
//结束计时器
-(void) endTimer;
@end
