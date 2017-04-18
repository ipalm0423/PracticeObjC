//
//  CollectionTableViewCell.h
//  TestView
//
//  Created by Jack KY Chen on 2017/4/18.
//  Copyright © 2017年 Jack KY Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


-(void)setCollectionViewWithDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)delegate row:(NSInteger)row;

@end
