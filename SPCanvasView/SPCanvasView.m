//
//  SPCanvasView.m
//  SPCanvasView
//
//  Created by Spring on 14-6-25.
//  Copyright (c) 2014年 aokizen. All rights reserved.
//

#import "SPCanvasView.h"

@interface SPCanvasView () {
    CGPoint lastPoint;
}

@property (strong, nonatomic) UIBezierPath *drawingPath;

@end

#pragma mark - Init
@implementation SPCanvasView

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    
    [self setBackgroundColor:[UIColor clearColor]];
    
    self.drawingPath = [UIBezierPath bezierPath];
    [self.drawingPath moveToPoint:CGPointZero];
    [self.drawingPath setLineWidth:20.0];
}

#pragma mark - Touch
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if (self.currentTouchMode == SPCanvasTouchModePaintBucket) {
        [self filling];
    }
    else {
        UITouch *touch = [touches anyObject];
        CGPoint location = [touch locationInView:self];
    
        [self.drawingPath moveToPoint:location];
        lastPoint = location;
        [self setNeedsDisplay];
    }
    
    NSLog(@"Touch Began");
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if (self.currentTouchMode == SPCanvasTouchModePaintBucket) {
        [self filling];
    }
    else {
        UITouch *touch = [touches anyObject];
        CGPoint location = [touch locationInView:self];
    
        [self.drawingPath addLineToPoint:location];
    
        [self setNeedsDisplay];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (self.currentTouchMode == SPCanvasTouchModePaintBucket) {
        [self filling];
    }
    else {
        [self touchesMoved:touches withEvent:event];
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    if (self.currentTouchMode != SPCanvasTouchModePaintBucket) {
        [self touchesMoved:touches withEvent:event];
    }
}

#pragma mark getter/setter
- (UIColor *)paintBucketColor {
    if (_paintBucketColor) {
        return _paintBucketColor;
    }
    
    return [UIColor whiteColor];
}

#pragma mark - drawing
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextClearRect(context, rect);
    
    CGContextSetFillColorWithColor(context, [UIColor colorWithRed:139.0f / 255.0f green:226.0f / 255.0f blue:202.0f / 255.0f alpha:1].CGColor);
    
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, self.frame.size.width, 0);
    CGContextAddLineToPoint(context, self.frame.size.width, self.frame.size.height);
    CGContextAddLineToPoint(context, 0, self.frame.size.height);
    CGContextAddLineToPoint(context, 0, 0);
    
    CGContextFillPath(context);
    
    if (self.currentTouchMode == SPCanvasTouchModeEraser) {
        [self eraseInContext:context];
    }
}

- (void)eraseInContext:(CGContextRef)context
{
    UIGraphicsPushContext( context );
    
    CGContextSetBlendMode( context, kCGBlendModeClear );
    [self.drawingPath stroke];
    
    UIGraphicsPopContext();
}

- (void)filling {

}

@end
