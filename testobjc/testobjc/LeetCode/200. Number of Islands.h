//
//  200. Number of Islands.h
//  testobjc
//
//  Created by Jack KY Chen on 2017/4/16.
//  Copyright © 2017年 Jack KY Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface _00__Number_of_Islands : NSObject
+(int)answer;
+(NSMutableArray*)initVisitMap:(NSInteger)x positionY:(NSInteger)y;
+(void)traversalInlandMap:(NSArray*)inlandMap visitMap:(NSMutableArray*)visitMap positionX:(NSInteger)x positionY:(NSInteger)y;
@end
