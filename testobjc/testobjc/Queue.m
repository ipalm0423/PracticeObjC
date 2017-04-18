//
//  Queue.m
//  testobjc
//
//  Created by Jack KY Chen on 2017/4/11.
//  Copyright © 2017年 Jack KY Chen. All rights reserved.
//

#import "Queue.h"

@implementation Queue{
    NSMutableArray *arr;
}

-(id)init{
    if (self = [super init]) {
        arr = [NSMutableArray new];
    }
    return self;
}

-(void)enqueue:(id)obj{
    if (obj) {
        [arr addObject:obj];
    }
}

-(id)dequeue{
    if (arr.count > 0) {
        id obj = arr[0];
        [arr removeObjectAtIndex:0];
        return obj;
    }
    return nil;
}

-(id)peek{
    if (arr.count > 0) {
        return arr[0];
    }
    return nil;
}

-(NSInteger)size{
    return arr.count;
}

@end
