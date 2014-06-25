//
//  SPCanvasView.h
//  SPCanvasView
//
//  Created by Spring on 14-6-25.
//  Copyright (c) 2014年 aokizen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    SPCanvasTouchModePencel,
    SPCanvasTouchModeEraser,
}SPCanvasTouchMode;

@interface SPCanvasView : UIView

@property (assign, nonatomic) SPCanvasTouchMode currentTouchMode;

@end
