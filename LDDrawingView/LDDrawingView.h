//
//  LDDrawingView.h
//  LDDrawingView
//
//  Created by Christian Di Lorenzo on 10/26/13.
//  Copyright (c) 2013 Light Design. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LDContextDrawingBlock)(CGContextRef context, CGRect rect);
typedef void(^LDConstraintBlock)(void);
typedef void(^LDLayoutDrawingBlock)(void);

@interface LDDrawingView : UIView

@property (nonatomic, strong) LDContextDrawingBlock drawRectBlock;
@property (nonatomic, strong) LDConstraintBlock constraintBlock;
@property (nonatomic, strong) LDLayoutDrawingBlock layoutBlock;

@end
