LDDrawingView
=============

# Purpose

On iOS, if you want to do **any** amount of custom drawing in a `UIView` you'll have to subclass it and override methods like `drawRect:` or `layoutSubviews:`. This isn't much of a problem if you are doing significant drawing. However, for simpler cases, this becomes somewhat cumbersome. `LDDrawingView` overcomes this by using two blocks settable from outside of the object: `drawRectBlock` and `layoutBlock`. In the example, I've provided an more complicated example with AutoLayout and such, but this isn't necessarily the optimum use. I would suggest that this class is used when you have a simple logo or drawing you need to have, but you don't want to subclass `UIView`.

If you want to simply write this code, take a look at [LDDrawingView.m](LDDrawingView/LDDrawingView.m). It's not very complicated, but is a nice addition to `UIView`.

# How To Use

Here's the code from the sample inside of a view controller:

```objc
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
```
