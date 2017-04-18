//
//  Queue.h
//  testobjc
//
//  Created by Jack KY Chen on 2017/4/11.
//  Copyright © 2017年 Jack KY Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Queue : NSObject

-(void)enqueue:(id)obj;
-(id)dequeue;
-(id)peek;
-(NSInteger)size;

@end
