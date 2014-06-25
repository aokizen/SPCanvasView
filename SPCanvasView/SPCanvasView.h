//
//  SPCanvasView.h
//  SPCanvasView
//
//  Created by Spring on 14-6-25.
//  Copyright (c) 2014年 aokizen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    SPCanvasTouchModePencil,
    SPCanvasTouchModeEraser,
    SPCanvasTouchModePaintBucket,
}SPCanvasTouchMode;

@interface SPCanvasView : UIView

@property (assign, nonatomic) SPCanvasTouchMode currentTouchMode;
@property (strong, nonatomic) UIColor *paintBucketColor;

@end
