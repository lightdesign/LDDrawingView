//
//  LDDrawingView.m
//  LDDrawingView
//
//  Created by Christian Di Lorenzo on 10/26/13.
//  Copyright (c) 2013 Light Design. All rights reserved.
//

#import "LDDrawingView.h"

@implementation LDDrawingView

- (void)drawRect:(CGRect)rect {
    if (self.drawRectBlock) {
        self.drawRectBlock(UIGraphicsGetCurrentContext(), rect);
    }
}

- (void)layoutSubviews {
    if (self.layoutBlock) {
        self.layoutBlock(self);
    }
    [super layoutSubviews];
}

@end
