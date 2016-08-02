//
//  LEDNSProgressView.m
//  MemoryDay
//
//  Created by Gao on 2/21/15.
//  Copyright (c) 2015 lea. All rights reserved.
//

#import "LEChromeProgressView.h"
#import <DACircularProgress/DACircularProgressView.h>

@interface LEChromeProgressView ()
@property(nonatomic, strong) DACircularProgressView *progressView;
@property(nonatomic, strong) DACircularProgressView *waitingView;
@end

@implementation LEChromeProgressView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {

    self.backgroundColor = [UIColor clearColor];
    _color = [UIColor colorWithWhite:0.3 alpha:1];
    _waitingStateEndurance = 0.15;

    // init progress view
    self.progressView = [[DACircularProgressView alloc] init];
    self.waitingView = [[DACircularProgressView alloc] init];
    for (DACircularProgressView *v in @[ self.waitingView, self.progressView ]) {
        [self addSubview:v];
        [v setTranslatesAutoresizingMaskIntoConstraints:NO];
        NSLayoutConstraint *height =
        [NSLayoutConstraint constraintWithItem:v
                                     attribute:NSLayoutAttributeHeight
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeHeight
                                    multiplier:1
                                      constant:0];
        NSLayoutConstraint *width =
        [NSLayoutConstraint constraintWithItem:v
                                     attribute:NSLayoutAttributeWidth
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeWidth
                                    multiplier:1
                                      constant:0];
        NSLayoutConstraint *centerX =
        [NSLayoutConstraint constraintWithItem:v
                                     attribute:NSLayoutAttributeCenterX
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeCenterX
                                    multiplier:1
                                      constant:0];
        NSLayoutConstraint *centerY =
        [NSLayoutConstraint constraintWithItem:v
                                     attribute:NSLayoutAttributeCenterY
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeCenterY
                                    multiplier:1
                                      constant:0];
        [self addConstraints:@[ height, width, centerX, centerY ]];
        v.thicknessRatio = 0.2;
        v.roundedCorners = YES;
        v.indeterminateDuration = 5;
        v.trackTintColor = [UIColor clearColor];
        v.progressTintColor = _color;
    }
    [self.waitingView setProgress:0.4 animated:NO];
    self.progressView.clockwiseProgress = NO;
}

- (void)setColor:(UIColor *)color {
    _color = color;
    for (DACircularProgressView *v in @[ self.waitingView, self.progressView ]) {
        v.progressTintColor = _color;
    }
}

- (void)setBeginLoading {
    self.hidden = NO;
    [self.progressView setProgress:0 animated:NO];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.waitingStateEndurance * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        if (self.progressView.progress < 0.001) {
            self.waitingView.hidden = NO;
            self.waitingView.alpha = 1;
            self.waitingView.indeterminate = YES;
        }
    });
}

- (void)setProgress:(CGFloat)progress {
    if (progress < 0.01) {
        return;
    }
    self.progressView.hidden = NO;
    [self.progressView setProgress:progress animated:YES];

    if (self.waitingView.alpha > 0.001) {
        [UIView animateWithDuration:0.3 animations:^{
            self.waitingView.alpha = 0;
        }];
    }
}

- (void)setFinishLoading {
    self.progressView.hidden = YES;
    self.waitingView.hidden = YES;
    self.hidden = YES;
}

@end
