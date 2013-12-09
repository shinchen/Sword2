//
//  ReaderView.m
//  iBook
//
//  Created by 赵雪峰 on 13-12-9.
//  Copyright (c) 2013年 赵雪峰. All rights reserved.
//

#import "ReaderView.h"

@implementation ReaderView

- (id)initWithPageRef:(CGPDFPageRef)pageRef
{
    if (self = [super init])
    {
        _pageData = pageRef;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)drawInContext:(CGContextRef)context
{
    CGContextTranslateCTM(context, 0.0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    CGContextSaveGState(context);

    CGAffineTransform pdfTransform = CGPDFPageGetDrawingTransform(_pageData, kCGPDFCropBox, self.bounds, 0, true);
    CGContextConcatCTM(context, pdfTransform);
    CGContextDrawPDFPage(context, _pageData);
    CGContextRestoreGState(context);
}

- (void)drawRect:(CGRect)rect
{
    [self drawInContext:UIGraphicsGetCurrentContext()];
}

@end
