//
//  RansomNote383.m
//  testobjc
//
//  Created by Jack KY Chen on 2017/4/24.
//  Copyright © 2017年 Jack KY Chen. All rights reserved.
//

#import "RansomNote383.h"

@implementation RansomNote383

+(BOOL)isCanConstruct:(NSString *)letter inMagazine:(NSString*)magazine {
    
    NSDictionary *letterCount = [self countForWord:letter];
    NSDictionary *mazCount = [self countForWord:magazine];
    __block BOOL result = YES;
    [letterCount enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSInteger compare = [mazCount[key] integerValue];
        NSInteger count = [obj integerValue];
        if (compare != count) {
            result = NO;
        }
    }];
    
    return result;
}

+(NSDictionary*)countForWord:(NSString*)words{
    NSMutableDictionary *dict = [NSMutableDictionary new];
    for (NSInteger i = 0; i< words.length;i++){
        NSString *word = [words substringWithRange:NSMakeRange(i, 1)];
        NSNumber *count = dict[word];
        if (count) {
            dict[word] = @(count.integerValue + 1);
        }else{
            dict[word] = @1;
        }
    }
    return dict;
}
@end
