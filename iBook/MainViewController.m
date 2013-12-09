//
//  MainViewController.m
//  iBook
//
//  Created by 赵雪峰 on 13-12-9.
//  Copyright (c) 2013年 赵雪峰. All rights reserved.
//

#import "MainViewController.h"
#import "ReaderViewController.h"


@implementation MainViewController

- (id)init
{
    if (self = [super init])
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        
        CFURLRef pdfURL = CFBundleCopyResourceURL(CFBundleGetMainBundle(), CFSTR("View Programming Guide for IOS.pdf"), NULL, NULL);
        _pdf = CGPDFDocumentCreateWithURL((CFURLRef)pdfURL);
        _pageNum = CGPDFDocumentGetNumberOfPages(_pdf);
        CFRelease(pdfURL);
    }
    
    return self;
}

- (void)dealloc
{
    _pageViewController.delegate = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl
                                                          navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                                                        options:nil];
    
    _pageViewController.delegate = self;
    _pageViewController.dataSource = self;
    
    _curPageIndex = 1;
    CGPDFPageRef firstPage = CGPDFDocumentGetPage(_pdf, _curPageIndex);
    
    ReaderViewController *firstControllerPage = [[ReaderViewController alloc] initWithPageRef:firstPage];
    
    [_pageViewController setViewControllers:[NSArray arrayWithObject:firstControllerPage]
                                  direction:UIPageViewControllerNavigationDirectionForward
                                   animated:NO
                                 completion:nil];
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    
    [_pageViewController didMoveToParentViewController:self];
    
    self.view.gestureRecognizers = _pageViewController.gestureRecognizers;
}

#pragma mark - UIPageViewControllerDelegate
- (UIPageViewControllerSpineLocation)pageViewController:(UIPageViewController *)pageViewController spineLocationForInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    return UIPageViewControllerSpineLocationMin;
}

#pragma mark - UIPageViewControllerDataSource
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    if (_curPageIndex <= 1)
    {
        return nil;
    }
    
    _curPageIndex--;

    CGPDFPageRef toPage = CGPDFDocumentGetPage(_pdf, _curPageIndex);
    ReaderViewController *pageController = [[ReaderViewController alloc] initWithPageRef:toPage];
    
    return pageController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    if (_curPageIndex >= _pageNum)
    {
        return nil;
    }
    
    _curPageIndex++;

    CGPDFPageRef toPage = CGPDFDocumentGetPage(_pdf, _curPageIndex);
    ReaderViewController *pageController = [[ReaderViewController alloc] initWithPageRef:toPage];
    
    return pageController;
}

@end
