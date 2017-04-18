//
//  LinkList.m
//  testobjc
//
//  Created by Jack KY Chen on 2017/4/15.
//  Copyright © 2017年 Jack KY Chen. All rights reserved.
//

#import "LinkList.h"

@implementation LinkList

-(id)initWithData:(id)obj{
    if (self = [self init]) {
        _data = obj;
    }
    return self;
}

-(void)appendToLast:(id)obj{
    if (obj) {
        LinkList *lastList = self.next;
        while (lastList.next != nil) {
            lastList = lastList.next;
        }
        
        //init
        LinkList *newList = [[LinkList alloc]initWithData:obj];
        lastList.next = newList;
    }
}





@end
