//
//  LDViewController.m
//  LDDrawingView
//
//  Created by Christian Di Lorenzo on 10/26/13.
//  Copyright (c) 2013 Light Design. All rights reserved.
//

#import "LDViewController.h"
#import "LDDrawingView.h"

@implementation LDViewController

- (void)loadView {
    [super loadView];
    LDDrawingView *drawingView = [[LDDrawingView alloc] init];
    drawingView.translatesAutoresizingMaskIntoConstraints = NO;
    drawingView.backgroundColor = [UIColor clearColor];
    
    [drawingView setDrawRectBlock:^(CGContextRef context, CGRect rect){
        CGContextSetFillColorWithColor(context, [UIColor darkGrayColor].CGColor);
        CGContextAddEllipseInRect(context, rect);
        CGContextFillPath(context);
    }];
    
    [drawingView setLayoutBlock:^(LDDrawingView *view){
        LDDrawingView *subview = [[LDDrawingView alloc] init];
        subview.backgroundColor = [UIColor clearColor];
        subview.translatesAutoresizingMaskIntoConstraints = NO;
        
        [subview setDrawRectBlock:^(CGContextRef context, CGRect rect){
            CGContextSetFillColorWithColor(context, [UIColor lightGrayColor].CGColor);
            UIRectFill(rect);
        }];
        
        [view addSubview:subview];
        [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(100)-[subview]-(100)-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(subview)]];
        [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(100)-[subview]-(100)-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(subview)]];
    }];
    
    [self.view addSubview:drawingView];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[drawingView]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(drawingView)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[drawingView]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(drawingView)]];
}

@end
