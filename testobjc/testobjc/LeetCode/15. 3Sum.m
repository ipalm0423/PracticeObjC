//
//  15. 3Sum.m
//  testobjc
//
//  Created by Jack KY Chen on 2017/4/22.
//  Copyright © 2017年 Jack KY Chen. All rights reserved.
//

#import "15. 3Sum.h"

@implementation _5__3Sum
+(NSArray *)sumOf3:(NSArray *)numbers{//total O(~N^3)
    NSArray *arr = [numbers sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 intValue] <= [obj2 intValue] ? NSOrderedAscending:NSOrderedDescending;
    }];//O(N*logN)


    NSMutableArray *ans = [NSMutableArray new];
    for (int i = 0; i < arr.count; ++i) {//O(N)
        if (i > 0 && [arr[i-1] intValue] == [arr[i] intValue]) {
            continue;
        }
        //O(N!)
        for (int j = i+1; j < arr.count; ++j) {
            for (NSInteger k = arr.count-1; k >= j+1 ; k--) {
                int a = [arr[i] intValue];
                int b = [arr[j] intValue];
                int c = [arr[k] intValue];
                if (a + b + c == 0) {
                    [ans addObject:@[@(a), @(b), @(c)]];
                    break;
                }
            }
        }
    }

    return ans;
}


+(NSArray *)imporveSumOf3:(NSArray *)numbers{//O(N^2)
    NSArray *arr = [numbers sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 intValue] <= [obj2 intValue] ? NSOrderedAscending:NSOrderedDescending;
    }];//O(N*logN)
    
    NSMutableArray *ans = [NSMutableArray new];
    for (NSInteger i = 0; i < arr.count-2; i++) {//O(N)
        if (i > 0 && [arr[i+1] intValue] == [arr[i] intValue]&& [arr[i-1] intValue] == [arr[i] intValue]) {//skip duplicate
            continue;
        }
        
        NSInteger left = i + 1, right = arr.count-1;
        
        while (left != right) {//O(N)
            int a = [arr[i] intValue];
            int b = [arr[left] intValue];
            int c = [arr[right] intValue];
            int total = a + b + c;
            if (total == 0) {
                [ans addObject:@[@(a), @(b), @(c)]];
                break;
            }else if (total < 0){
                left ++;
            }else{
                right --;
            }
        }
        
    }
    
    return ans;
}


@end
