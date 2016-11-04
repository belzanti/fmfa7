//
//  ColoredAccessory.h
//  PDM_iOS
//
//  Created by Web Libre Consulting on 23/02/2016.
//  Copyright © 2016 Web Libre Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ColoredAccessoryType){
    ColoredAccessoryTypeDisclosureIndicator,
    ColoredAccessoryTypeCheckMark
};


@interface ColoredAccessory : UIControl

@property (nonatomic, retain) UIColor *color;
@property (nonatomic, retain) UIColor *highlightedColor;
@property (nonatomic) ColoredAccessoryType type;

+ (ColoredAccessory *)accessoryWithColor:(UIColor *)pColor type:(ColoredAccessoryType)pType;

@end
