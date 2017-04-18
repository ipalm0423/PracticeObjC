//
//  79.Word Search.h
//  testobjc
//
//  Created by Jack KY Chen on 2017/4/16.
//  Copyright © 2017年 Jack KY Chen. All rights reserved.
//
#import <Foundation/Foundation.h>
@interface _9_Word_Search : NSObject

//https://leetcode.com/problems/word-search/#/description

+(BOOL)findPathByMap:(NSArray*)map visitMap:(NSMutableArray*)visitMap word:(NSString*)texts pointX:(int)x pointY:(int)y;

@end
