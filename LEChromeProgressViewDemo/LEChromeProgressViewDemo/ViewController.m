//
//  ViewController.m
//  LEChromeProgressViewDemo
//
//  Created by Gao on 7/28/16.
//  Copyright © 2016 leave. All rights reserved.
//

#import "ViewController.h"
#import <LEChromeProgressView/LEChromeProgressView.h>
@interface ViewController ()
@property (nonatomic) LEChromeProgressView *progressIndicator;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.progressIndicator = [[LEChromeProgressView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.bounds) - 12, 200, 25, 25)];
    [self.view addSubview:self.progressIndicator];
    self.progressIndicator.color = [UIColor colorWithWhite:0.8 alpha:1];

    UIButton *b = [UIButton buttonWithType:UIButtonTypeSystem];
    [b setTitle:@"show" forState:UIControlStateNormal];
    b.frame = CGRectMake(CGRectGetMidX(self.view.bounds) - 40, 400, 80, 44);
    [b addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b];
}

- (void)tap {
    [self.progressIndicator setBeginLoading];

    NSTimeInterval waitingTime = drand48() * 2;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(waitingTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        CGFloat total = 4;
        [self delayPerformCount:total onceTime:0.5 action:^(NSInteger count){
            NSLog(@"%f", (total-count)/total);
            [self.progressIndicator setProgress:(total-count)/total];
        } completion:^{
            [self.progressIndicator setFinishLoading];
        }];

    });

}

- (void)delayPerformCount:(NSInteger)count onceTime:(NSTimeInterval)onceTime action:(void(^)(NSInteger count))action completion:(void(^)())completion {
    if (count < 0) {
        if (completion) {
            completion();
        }
        return;
    }

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(onceTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        if (action) {
            action(count);
        }
        [self delayPerformCount:count - 1 onceTime:onceTime action:action completion:completion];
    });

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
