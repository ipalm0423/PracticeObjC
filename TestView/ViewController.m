//
//  ViewController.m
//  TestView
//
//  Created by Jack KY Chen on 2017/4/16.
//  Copyright © 2017年 Jack KY Chen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *l1 = [[UILabel alloc]init];
    UILabel *l2 = [[UILabel alloc]init];
    [l1 addSubview:l2];
    [self.view addSubview:l1];
    NSArray *arr = [self fetchLabelsFromView:self.view];
    
    UIButton *b1 = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *b2 = [UIButton buttonWithType:UIButtonTypeSystem];
    UIButton *b3 = [UIButton buttonWithType:UIButtonTypeInfoLight];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSArray*)fetchLabelsFromView:(UIView*)view{
    NSMutableArray *arr = [NSMutableArray new];
    for (UIView *subView in view.subviews) {
        if (subView.subviews.count > 0) {
            [arr addObjectsFromArray:[self fetchLabelsFromView:subView]];
        }
        
        if ([subView isKindOfClass:[UILabel class]]) {
            [arr addObject:subView];
        }
    }
    return arr;
}

@end
