//
//  LEChromeProgressView.h
//  LEChromeProgressView
//
//  Created by Gao on 7/28/16.
//  Copyright © 2016 leave. All rights reserved.
//

#import <UIKit/UIKit.h>

////! Project version number for LEChromeProgressView.
//FOUNDATION_EXPORT double LEChromeProgressViewVersionNumber;
//
////! Project version string for LEChromeProgressView.
//FOUNDATION_EXPORT const unsigned char LEChromeProgressViewVersionString[];
//
//// In this header, you should import all the public headers of your framework using statements like #import <LEChromeProgressView/PublicHeader.h>
//
//


#import <UIKit/UIKit.h>

@interface LEChromeProgressView : UIView
@property (nonatomic) NSTimeInterval waitingStateEndurance;
@property (nonatomic) UIColor *color;

- (void)setBeginLoading;
- (void)setProgress:(CGFloat)progress;
- (void)setFinishLoading;

@end
