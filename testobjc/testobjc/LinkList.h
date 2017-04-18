//
//  LinkList.h
//  testobjc
//
//  Created by Jack KY Chen on 2017/4/15.
//  Copyright © 2017年 Jack KY Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LinkList : NSObject

@property (strong, nonatomic) id data;
@property (strong, nonatomic) LinkList *next;


-(void)appendToLast:(id)obj;

@end
