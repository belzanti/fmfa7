//
//  BBBadgedBarButton.h
//  PDM_iOS
//
//  Created by Web Libre Consulting on 23/02/2016.
//  Copyright © 2016 Web Libre Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBBadgeBarButtonItem : UIBarButtonItem

// Each time you change one of the properties, the badge will refresh with your changes

// Badge value to be display
@property (nonatomic) NSString *badgeValue;
// Badge background color
@property (nonatomic) UIColor *badgeBGColor;
// Badge text color
@property (nonatomic) UIColor *badgeTextColor;
// Badge font
@property (nonatomic) UIFont *badgeFont;
// Padding value for the badge
@property (nonatomic) CGFloat badgePadding;
// Minimum size badge to small
@property (nonatomic) CGFloat badgeMinSize;
// Values for offseting the badge over the BarButtonItem you picked
@property (nonatomic) CGFloat badgeOriginX;
@property (nonatomic) CGFloat badgeOriginY;
// In case of numbers, remove the badge when reaching zero
@property BOOL shouldHideBadgeAtZero;
// Badge has a bounce animation when value changes
@property BOOL shouldAnimateBadge;

- (BBBadgeBarButtonItem *)initWithCustomUIButton:(UIButton *)customButton;

@end