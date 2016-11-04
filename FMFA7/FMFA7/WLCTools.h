//
//  WLCTools.h
//  PDM_iOS
//
//  Created by Web Libre Consulting on 23/02/2016.
//  Copyright © 2016 Web Libre Consulting. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLCTools : NSObject

+ (NSString *)imageSizeNamedWithName:(NSString *)pName;
+ (NSString *)imageFullScreenSizeNamedWithName:(NSString *)pName;
+ (NSString *)MD5String:(NSString *)pString;
+ (void)setExpectedHeightForLabel:(UILabel *)label maxHeight:(CGFloat)maxHeight;

@end
