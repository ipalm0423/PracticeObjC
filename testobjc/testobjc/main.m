//
//  main.m
//  testobjc
//
//  Created by Jack KY Chen on 2017/3/14.
//  Copyright © 2017年 Jack KY Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <stdio.h>
#import "Queue.h"
#import "Stack.h"
#import "79.Word Search.h"
#import "NSString+Rabin_Karp.h"
#import "200. Number of Islands.h"
#import "139. Word Break.h"
#import "15. 3Sum.h"
#import "RansomNote383.h"
#import "Searcha2DMatrixII240.h"

enum SomeEnum : NSInteger {
    SomeEnumA
};

typedef enum SomeEnum SomeEnum;
typedef void(^SomeBlock) (int a);
typedef NSString SomeSTR;
typedef struct {
    float x;
    float y;
}SomeStruct;



@protocol SomeProtocol
@required
-(void)foo;
@optional
-(void)bar;
@end

@interface Foo : NSObject
- (void)doSomething;
@property (strong) NSString *str;
@end

@implementation Foo
- (void)doSomething {
    sleep(1);
    @synchronized(self) {
        NSLog(@"Critical Section.");
    }
}
@end

void printWord(NSString*str){
    NSLog(@"%@", str);
    return;
}

int calculateCountForWord(NSString *str, NSString *text){
    int count = 0;
    NSInteger index = 0;
    
    while (index < text.length) {
        NSRange range = [text rangeOfString:str options:0 range:NSMakeRange(index, text.length - index)];
        if (range.location != NSNotFound) {
            index = range.location + 1;
            count++;
        }else{
            break;
        }
        
       
    }
    return count;
}
void someF(SomeBlock blk) {
    
}
int singleDigit(NSString *str) {
    if ([str isEqualToString:@"0"]) {
        return 0;
    }else if ([str isEqualToString:@"1"]){
        return 1;
    }else if ([str isEqualToString:@"2"]){
        return 2;
    }else if ([str isEqualToString:@"3"]){
        return 3;
    }else if ([str isEqualToString:@"4"]){
        return 4;
    }else if ([str isEqualToString:@"5"]){
        return 5;
    }else if ([str isEqualToString:@"6"]){
        return 6;
    }else if ([str isEqualToString:@"7"]){
        return 7;
    }else if ([str isEqualToString:@"8"]){
        return 8;
    }else if ([str isEqualToString:@"9"]){
        return 9;
    }
    
    return 0;
}

NSMutableArray *getVisitArrat(NSInteger x, NSInteger y){
    NSMutableArray *visit = [NSMutableArray new];
    
    for (int i = 0; i < y; i++){
        NSMutableArray *row = [NSMutableArray new];
        for (int i = 0;i < x; i++){
            [row addObject:@0];
        }
        [visit addObject:row];
    }
    return visit;
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        NSString *str = @"lll";
        NSString *maz = @"leetleet";
        NSArray *arr = @[@1, @2, @3, @4];
        NSArray *arr2d = [Searcha2DMatrixII240 getQuestionArr];
        BOOL isContain = [Searcha2DMatrixII240 improvementBinaryTreeSearch:arr2d forNums:@18];
        
        NSLog(@"%@", isContain ? @"YES":@"NO");
    }
    
    return 0;
}



