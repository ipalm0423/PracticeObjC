//
//  Stack.h
//  testobjc
//
//  Created by Jack KY Chen on 2017/4/11.
//  Copyright © 2017年 Jack KY Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Stack : NSObject

-(void)push:(id)obj;
-(id)pop;
-(NSInteger)size;
-(id)peek;
@end
