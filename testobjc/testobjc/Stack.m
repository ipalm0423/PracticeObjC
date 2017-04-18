//
//  Stack.m
//  testobjc
//
//  Created by Jack KY Chen on 2017/4/11.
//  Copyright © 2017年 Jack KY Chen. All rights reserved.
//

#import "Stack.h"

@implementation Stack{
    NSMutableArray *arr;
}

-(id)init{
    if (self = [super init]){
        arr = [NSMutableArray new];
    }
    return self;
}

-(void)push:(id)obj{
    if (obj) {
        [arr addObject:obj];
    }
}

-(id)pop{
    if (arr.count > 0) {
        id obj = arr.lastObject;
        [arr removeLastObject];
        return obj;
    }
    return nil;
}

-(NSInteger)size{
    return arr.count;
}

-(id)peek{
    if (arr.count > 0) {
        return arr.lastObject;
    }
    return nil;
}


@end
