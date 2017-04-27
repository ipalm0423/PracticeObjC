//
//  Searcha2DMatrixII240.m
//  testobjc
//
//  Created by Jack KY Chen on 2017/4/27.
//  Copyright © 2017年 Jack KY Chen. All rights reserved.
//

#import "Searcha2DMatrixII240.h"

@implementation Searcha2DMatrixII240
+(NSArray *)getQuestionArr{
    return @[
     @[@1,   @4,  @7, @11, @15],
     @[@2,   @5,  @8, @12, @19],
     @[@3,   @6,  @9, @16, @22],
     @[@10, @13, @14, @17, @24],
     @[@18, @21, @23, @26, @30]
     ];
}

+(BOOL)search2DArray:(NSArray<NSArray*>*)arr2d forNum:(NSNumber*)num{
    for (NSInteger i = 0; i < arr2d.count; i++) {
        NSArray *arr = arr2d[i];
        NSInteger index = [self binarySearch:arr forNums:num];
        if (index != NSNotFound) {
            return YES;
        }
    }
    
    return NO;
}
+(NSInteger)binarySearch:(NSArray<NSNumber*>*)arr forNums:(NSNumber*)num{
    
    if (arr.count == 1) {
        return (num == arr[0]);
    }
    NSInteger start = 0;
    NSInteger end = arr.count-1;
    
    while (start != end) {
        NSInteger index = (start + end) / 2;
        NSNumber *compare = arr[index];
        if ([compare isEqualToNumber: num]) {
            return index;
        }else if (compare < num){
            start = (index + 1) <= end ? (index + 1) : end;
        }else{
            end = (index - 1) >= start ? (index - 1): start;
        }
    }
    if ([arr[start] isEqualToNumber:num]) {
        return start;
    }else {
        return NSNotFound;
    }
}

+(BOOL)improvementBinaryTreeSearch:(NSArray<NSArray*>*)arr2d forNums:(NSNumber*)num{
    NSInteger x = arr2d[0].count - 1;
    NSInteger y = 0;
    
    while (y < arr2d.count && x >= 0) {
        NSNumber *compare = arr2d[y][x];
        if ([compare isEqualToNumber:num]) {
            return YES;
        }else if ([compare isGreaterThan:num]){
            x--;
        }else{
            y++;
        }
    }
    return NO;
}

@end
