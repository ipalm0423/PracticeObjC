//
//  79.Word Search.m
//  testobjc
//
//  Created by Jack KY Chen on 2017/4/16.
//  Copyright © 2017年 Jack KY Chen. All rights reserved.
//

#import "79.Word Search.h"

@implementation _9_Word_Search


+(BOOL)findPathByMap:(NSArray*)map visitMap:(NSMutableArray*)visitMap word:(NSString*)texts pointX:(int)x pointY:(int)y{
    NSString *word = [texts substringWithRange:NSMakeRange(0, 1)];
    
    if (x<0 || x >= ((NSArray*)map[0]).count || y < 0 || y >= map.count || [(NSNumber*)visitMap[y][x] boolValue] || ![word isEqualToString:map[y][x]]) {
        return NO;
    }
    
    NSString *subs = [texts substringWithRange:NSMakeRange(1, texts.length-1)];
    if (subs.length == 0) {
        return YES;
    }
    
    visitMap[y][x] = @1;
    //UP
    if ([self findPathByMap:map visitMap:visitMap word:subs pointX:x pointY:(y-1)]) {
        return YES;
    }else if ([self findPathByMap:map visitMap:visitMap word:subs pointX:x pointY:(y+1)]){
        return YES;
    }else if ([self findPathByMap:map visitMap:visitMap word:subs pointX:(x-1) pointY:y]){
        return YES;
    }else if ([self findPathByMap:map visitMap:visitMap word:subs pointX:(x+1) pointY:y]){
        return YES;
    }
    
    return NO;
}


@end
