//
//  ColoredAccessory.m
//  PDM_iOS
//
//  Created by Web Libre Consulting on 23/02/2016.
//  Copyright © 2016 Web Libre Consulting. All rights reserved.
//

#import "ColoredAccessory.h"

@implementation ColoredAccessory

- (id)initWithFrame:(CGRect)frame{
    if((self = [super initWithFrame:frame])){
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

+ (ColoredAccessory *)accessoryWithColor:(UIColor *)pColor type:(ColoredAccessoryType)pType{
    ColoredAccessory *accessory = [[ColoredAccessory alloc] initWithFrame:CGRectMake(0, 0, 20.0, 20.0)];
    accessory.color = pColor;
    accessory.type = pType;
    
    return accessory;
}

- (void)drawDisclosureIndicator{
    // (x,y) is the tip of the arrow
    CGFloat x = CGRectGetMaxX(self.bounds)-3.0;;
    CGFloat y = CGRectGetMidY(self.bounds);
    const CGFloat R = 4.5;
    CGContextRef ctxt = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ctxt, x-R, y-R);
    CGContextAddLineToPoint(ctxt, x, y);
    CGContextAddLineToPoint(ctxt, x-R, y+R);
    CGContextSetLineCap(ctxt, kCGLineCapSquare);
    CGContextSetLineJoin(ctxt, kCGLineJoinMiter);
    CGContextSetLineWidth(ctxt, 2);
    
    if(self.highlighted){
        [self.highlightedColor setStroke];
    }else{
        [self.color setStroke];
    }
    
    CGContextStrokePath(ctxt);
}

- (void)drawCheckMark{
    // (x,y) is the tip of the arrow
    CGFloat x = CGRectGetMaxX(self.bounds)-1.0;
    CGFloat y = 7;
    const CGFloat R = 3.5;
    CGContextRef ctxt = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ctxt, x, y);
    CGContextAddLineToPoint(ctxt, x-2.0*R, y+1.8*R);
    CGContextAddLineToPoint(ctxt, x-2.7*R, y+0.8*R);
    CGContextSetLineCap(ctxt, kCGLineCapRound);
    CGContextSetLineJoin(ctxt, kCGLineJoinRound);
    CGContextSetLineWidth(ctxt, 2.3);
    
    if (self.highlighted){
        [self.highlightedColor setStroke];
    }else{
        [self.color setStroke];
    }
    
    CGContextStrokePath(ctxt);
}

- (void)drawRect:(CGRect)rect{
    switch (_type) {
        case ColoredAccessoryTypeDisclosureIndicator:
            [self drawDisclosureIndicator];
            break;
            
        case ColoredAccessoryTypeCheckMark:
            [self drawCheckMark];
            break;
            
        default:
            break;
    }
}

@end
