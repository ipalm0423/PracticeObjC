//
//  200. Number of Islands.m
//  testobjc
//
//  Created by Jack KY Chen on 2017/4/16.
//  Copyright © 2017年 Jack KY Chen. All rights reserved.
//

#import "200. Number of Islands.h"

@implementation _00__Number_of_Islands
+(NSMutableArray*)initVisitMap:(NSInteger)x positionY:(NSInteger)y{
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i < y; i++) {
        NSMutableArray *row = [NSMutableArray new];
        for (int j = 0; j < x; j++) {
            [row addObject:@0];
        }
        [arr addObject:row];
    }
    return arr;
}

+(int)answer{
    NSArray *island = @[ @[@1, @1, @0],
                         @[@0, @0, @0],
                         @[@0, @1, @1]];
    NSMutableArray *visit = [_00__Number_of_Islands initVisitMap:((NSArray*)island[0]).count positionY:island.count];
    int count = 0;
    for (int i = 0; i < island.count; i++) {//y
        for (int j = 0; j < ((NSArray*)island[0]).count; j++) {//x
            if ([island[i][j] isEqualToNumber:@1] && [visit[i][j] isEqualToNumber:@0]) {
                [_00__Number_of_Islands traversalInlandMap:island visitMap:visit positionX:j positionY:i];
                count ++;
            }
        }
    }
    return count;
}

+(void)traversalInlandMap:(NSArray*)inlandMap visitMap:(NSMutableArray*)visitMap positionX:(NSInteger)x positionY:(NSInteger)y{
    if (x < 0 || x >= ((NSArray*)inlandMap[0]).count || y < 0 || y >= inlandMap.count || [visitMap[y][x]  isEqual: @1] || [inlandMap[y][x] isEqualToNumber:@0]) {
        return;
    }
    
    visitMap[y][x] = @1;
    
    //up
    [self traversalInlandMap:inlandMap visitMap:visitMap positionX:x positionY:(y-1)];
    [self traversalInlandMap:inlandMap visitMap:visitMap positionX:x positionY:(y+1)];
    [self traversalInlandMap:inlandMap visitMap:visitMap positionX:(x-1) positionY:y];
    [self traversalInlandMap:inlandMap visitMap:visitMap positionX:(x+1) positionY:y];
}


@end
