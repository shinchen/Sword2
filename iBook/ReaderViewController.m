//
//  ReaderViewController.m
//  iBook
//
//  Created by 赵雪峰 on 13-12-9.
//  Copyright (c) 2013年 赵雪峰. All rights reserved.
//

#import "ReaderViewController.h"
#import "ReaderView.h"

@interface ReaderViewController ()

@end

@implementation ReaderViewController

- (id)initWithPageRef:(CGPDFPageRef)pageRef
{
    if (self = [super init])
    {
        _pageData = pageRef;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    ReaderView *readerView = [[ReaderView alloc] initWithPageRef:_pageData];
    readerView.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height);
    
    [self.view addSubview:readerView];
}

@end
