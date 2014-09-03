//
//  dfViewController.m
//  QC Killa
//
//  Created by Derek Fidler on 8/28/14.
//  Copyright (c) 2014 derekfidler.com. All rights reserved.
//

#import "dfViewController.h"
#import <pop/POP.h>

@interface dfViewController ()
@property (weak, nonatomic) IBOutlet UIButton *recordBtn;
@property (weak, nonatomic) IBOutlet UIImageView *cameraPlaceholderView;
- (IBAction)touchUp:(id)sender;
- (IBAction)touchDown:(id)sender;

@end

@implementation dfViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [_recordBtn addTarget:self action:@selector(touchUp:) forControlEvents:UIControlEventTouchUpInside];
    [_recordBtn addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    
}

- (IBAction)touchUp:(id)sender {
    
    POPSpringAnimation *camViewScaleUp = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerBounds];
    camViewScaleUp.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 320, 568)];
    camViewScaleUp.springBounciness = 10.0f;
    camViewScaleUp.springSpeed = 15;
    [_cameraPlaceholderView pop_addAnimation:camViewScaleUp forKey:@"size"];
    
    POPSpringAnimation *tileShow = [POPSpringAnimation animationWithPropertyNamed:kPOPViewAlpha];
    tileShow.fromValue = @(0.0);
    tileShow.toValue = @(1.0);
    tileShow.springBounciness = 0.0f;
    tileShow.springSpeed = 15;
    [_recordBtn pop_addAnimation:tileShow forKey:@"fade"];
    
}

- (IBAction)touchDown:(id)sender {
    
    POPSpringAnimation *camViewScaleDown = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerBounds];
    camViewScaleDown.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 304, 540)];
    camViewScaleDown.springBounciness = 10.0f;
    camViewScaleDown.springSpeed = 15;
    [_cameraPlaceholderView pop_addAnimation:camViewScaleDown forKey:@"size"];
    
    POPSpringAnimation *tileHide = [POPSpringAnimation animationWithPropertyNamed:kPOPViewAlpha];
    tileHide.fromValue = @(1.0);
    tileHide.toValue = @(0.0);
    tileHide.springBounciness = 0.f;
    tileHide.springSpeed= 15;
    [_recordBtn pop_addAnimation:tileHide forKey:@"fade"];
    
}

@end
