//
//  WLCTools.m
//  PDM_iOS
//
//  Created by Web Libre Consulting on 23/02/2016.
//  Copyright © 2016 Web Libre Consulting. All rights reserved.
//

#import "WLCTools.h"

#import <CommonCrypto/CommonDigest.h>

@implementation WLCTools

+ (NSString *)imageSizeNamedWithName:(NSString *)pName{
    NSString *logoImageName = pName;
    if(IS_IPHONE){
        logoImageName = [NSString stringWithFormat:@"%@-320x128", pName];//iPhone Non Retina
        if(IS_RETINA){//4, 4S, 5, 6DZ
            logoImageName = [NSString stringWithFormat:@"%@-640x256", pName];
            if(IS_IPHONE_6){//6
                logoImageName = [NSString stringWithFormat:@"%@-750x256", pName];
            }else if(IS_IPHONE_6P_DZ){//6+DZ
                logoImageName = [NSString stringWithFormat:@"%@-1125x384", pName];
            }else if(IS_IPHONE_6P){//6+
                logoImageName = [NSString stringWithFormat:@"%@-1242x384", pName];
            }
        }
    }else{
        logoImageName = [NSString stringWithFormat:@"%@-768x128", pName];
        if(IS_RETINA){
            logoImageName = [NSString stringWithFormat:@"%@-1536x256", pName];
        }
    }
    
    return logoImageName;
}

+ (NSString *)imageFullScreenSizeNamedWithName:(NSString *)pName{
    NSString *logoImageName = pName;
    if(IS_IPHONE){
        logoImageName = [NSString stringWithFormat:@"%@-640x960", pName];
        if(IS_IPHONE_5){
            logoImageName = [NSString stringWithFormat:@"%@-640x1136", pName];
        }else if(IS_IPHONE_6){//6
            logoImageName = [NSString stringWithFormat:@"%@-750x1334", pName];
        }else if(IS_IPHONE_6P_DZ){//6+DZ
            logoImageName = [NSString stringWithFormat:@"%@-1125x2001", pName];
        }else if(IS_IPHONE_6P){//6+
            logoImageName = [NSString stringWithFormat:@"%@-1242x2208", pName];
        }
    }else{
        logoImageName = [NSString stringWithFormat:@"%@-768x1024", pName];
        if(IS_RETINA){
            logoImageName = [NSString stringWithFormat:@"%@-1536x2048", pName];
        }
    }
    
    return logoImageName;
}



+ (NSString *)MD5String:(NSString *)pString {
    const char *cStr = [pString UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result );
    
    return [NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}



+ (void)setExpectedHeightForLabel:(UILabel *)label maxHeight:(CGFloat)maxHeight{
    [label setNumberOfLines:0];
    [label setLineBreakMode:NSLineBreakByWordWrapping];
    CGSize currentLabelSize = CGSizeMake(label.frame.origin.x, label.frame.origin.y);
    
    NSDictionary *attributesDictionary = @{NSFontAttributeName:label.font};
    CGSize maximumLabelSize = CGSizeMake(label.frame.size.width, maxHeight);
    CGRect expectedLabelRect = [label.text boundingRectWithSize:maximumLabelSize options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:attributesDictionary context:nil];
    CGSize expectedLabelSize = expectedLabelRect.size;
    [label setFrame:CGRectMake(currentLabelSize.width, currentLabelSize.height, expectedLabelSize.width, expectedLabelSize.height)];
}

@end
