//
//  Searcha2DMatrixII240.h
//  testobjc
//
//  Created by Jack KY Chen on 2017/4/27.
//  Copyright © 2017年 Jack KY Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Searcha2DMatrixII240 : NSObject

+(NSArray *)getQuestionArr;

+(NSInteger)binarySearch:(NSArray<NSNumber*>*)arr forNums:(NSNumber*)num;

+(BOOL)search2DArray:(NSArray<NSArray*>*)arr2d forNum:(NSNumber*)num;
+(BOOL)improvementBinaryTreeSearch:(NSArray<NSArray*>*)arr2d forNums:(NSNumber*)num;

@end
