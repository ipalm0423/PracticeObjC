//
//  NSString+Rabin_Karp.m
//  testobjc
//
//  Created by Jack KY Chen on 2017/4/16.
//  Copyright © 2017年 Jack KY Chen. All rights reserved.
//

#import "NSString+Rabin_Karp.h"

@implementation NSString (Rabin_Karp)

//+(NSInteger)rollingHash:(NSString*)str {
//    
//}


-(BOOL)haveSubstring:(NSString*)str{
    if (self.length < str.length) {
        return NO;
    }
    
    
    BOOL result = NO;
    for (int i = 0; i <= self.length - str.length; i++) {
        for (int j = 0; j < str.length; j++) {
            char compare = [str characterAtIndex:j];//[str substringWithRange:NSMakeRange(j, 1)];
            char orig = [self characterAtIndex:(i + j)];//[self substringWithRange:NSMakeRange((i + j), 1)];
            if (compare != orig) {
                result = NO;
                break;
            }else{
                result = YES;
            }
        }
        if (result) {
            break;
        }
    }
    return result;
}

@end
