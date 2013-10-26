//
//  LDDrawingView.h
//  LDDrawingView
//
//  Created by Christian Di Lorenzo on 10/26/13.
//  Copyright (c) 2013 Light Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LDDrawingView;

@interface LDDrawingView : UIView

@property (nonatomic, strong) void(^drawRectBlock)(CGContextRef context, CGRect rect);
@property (nonatomic, strong) void(^layoutBlock)(LDDrawingView *view);

@end
