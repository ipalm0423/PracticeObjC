//
//  139. Word Break.m
//  testobjc
//
//  Created by Jack KY Chen on 2017/4/18.
//  Copyright © 2017年 Jack KY Chen. All rights reserved.
//

#import "139. Word Break.h"


@implementation _39__Word_Break

#pragma mark - DP


#pragma mark - fail case
//The following method will be fail at test case below:
//
//NSString *str = @"leetleet";
//NSArray *arr = @[@"leet", @"code", @"lee"];
//
+(BOOL)isText:(NSString*)text areListOfDict:(NSArray *)dict{
    
    //n == dict.count
    //k == text.length
    
    NSString *temp = text;
    
    for (NSString *word in dict) {//O(n)
        if (temp.length == 0) {
            break;
        }
        //s == word.length
        NSRange range = [temp rangeOfString:word];//O(k + s)
        if (range.location != NSNotFound) {
            temp = [NSString stringWithFormat:@"%@%@", [temp substringToIndex:range.location], [temp substringFromIndex:range.location + range.length]];
            
        }
    }
    if (temp.length == 0) {
        return YES;
    }else{
        return NO;
    }
}

+(BOOL)improvementIsText:(NSString*)text areListOfDict:(NSArray *)words{//total O(n + k)
    NSMutableDictionary *dict = [NSMutableDictionary new];
    if (text.length == 0) {
        return NO;
    }
    for (NSString *word in words) {//O(n)
        [dict setValue:@1 forKey:word];
    }
    
    NSInteger validIndex = 0;
    for (int i = 1; i <= text.length; i++) {//O(k)
        if (validIndex >= text.length) {
            break;
        }
        NSString *substring = [text substringWithRange:NSMakeRange(validIndex, (i - validIndex))];
        if ([dict valueForKey:substring]) {
            validIndex = i;
        }
    }
    
    if (validIndex == text.length) {
        return YES;
    }else{
        return NO;
    }
}

+ (BOOL)dpSolution:(NSString *)text isInDict:(NSDictionary *)dict {
    NSMutableArray *dp = [NSMutableArray arrayWithCapacity:text.length];
    for (int i = 0; i < text.length+1; i++) {
        [dp addObject:@0];
    }

    
    
    for (int i = 1; i < text.length+1; ++i) {
        for (NSUInteger j = 0; j < i; ++j) {
            if (j == 0) {
                NSString *str = [text substringWithRange:NSMakeRange(j, i)];
                if ([dict objectForKey:str]) {
                    dp[i] = @1;
                }
            }else if ([dp[j] boolValue] ) {
                NSString *str = [text substringWithRange:NSMakeRange(j, i-j)];
                if ([dict objectForKey:str]) {
                    dp[i] = @1;
                }
            }
        }
    }
    
    return [dp[text.length] boolValue];
}

@end
