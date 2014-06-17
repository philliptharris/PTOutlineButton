//
//  PTOutlineButton.m
//  PTOutlineButtonExample
//
//  Created by Phillip Harris on 6/17/14.
//  Copyright (c) 2014 Phillip Harris. All rights reserved.
//

#import "PTOutlineButton.h"

@implementation PTOutlineButton

//===============================================
#pragma mark -
#pragma mark Initialization
//===============================================

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    
    _strokeColor = [UIColor blackColor];
    _fillColor = [UIColor whiteColor];
    
    self.backgroundColor = _fillColor;
    [self setTitleColor:_strokeColor forState:UIControlStateNormal];
    
    self.layer.cornerRadius = 8.0;
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = _strokeColor.CGColor;
}

//===============================================
#pragma mark -
#pragma mark UIControl Touch Tracking
//===============================================

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    
    self.backgroundColor = self.strokeColor;
    
    [self setTitleColor:self.fillColor forState:UIControlStateNormal];
    
    return YES;
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    return YES;
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    [self endOrCancel];
}

- (void)cancelTrackingWithEvent:(UIEvent *)event {
    [self endOrCancel];
}

- (void)endOrCancel {
    
    self.backgroundColor = self.fillColor;
    
    [self setTitleColor:self.strokeColor forState:UIControlStateNormal];
}

@end
