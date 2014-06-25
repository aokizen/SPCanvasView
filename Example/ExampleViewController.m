//
//  ExampleViewController.m
//  SPCanvasView
//
//  Created by Spring on 14-6-25.
//  Copyright (c) 2014年 aokizen. All rights reserved.
//

#import "ExampleViewController.h"

#import "SPCanvasView.h"

@interface ExampleViewController ()

@property (weak, nonatomic) IBOutlet SPCanvasView *canvasView;

@end

@implementation ExampleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.canvasView.layer.borderWidth = 1.0;
    self.canvasView.layer.borderColor = [UIColor colorWithRed:220.0f / 255.0f green:218.0f / 255.0f blue:218.0f / 255.0f alpha:1].CGColor;
    [self.canvasView setCurrentTouchMode:SPCanvasTouchModeEraser];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
