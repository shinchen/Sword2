//
//  MainViewController.h
//  iBook
//
//  Created by 赵雪峰 on 13-12-9.
//  Copyright (c) 2013年 赵雪峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<UIPageViewControllerDelegate, UIPageViewControllerDataSource>
{
    UIPageViewController *_pageViewController;
    CGPDFDocumentRef    _pdf;
    NSUInteger          _pageNum;
    NSUInteger          _curPageIndex;
}

@end
