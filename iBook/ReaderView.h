//
//  ReaderView.h
//  iBook
//
//  Created by 赵雪峰 on 13-12-9.
//  Copyright (c) 2013年 赵雪峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReaderView : UIView
{
    CGPDFPageRef _pageData;
}

- (id)initWithPageRef:(CGPDFPageRef)pageRef;

@end
