//
//  CollectionTableViewCell.m
//  TestView
//
//  Created by Jack KY Chen on 2017/4/18.
//  Copyright © 2017年 Jack KY Chen. All rights reserved.
//

#import "CollectionTableViewCell.h"

@implementation CollectionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setCollectionViewWithDelegate:(id<UICollectionViewDataSource,UICollectionViewDelegate>)delegate row:(NSInteger)row {
    self.collectionView.delegate = delegate;
    self.collectionView.dataSource = delegate;
    self.collectionView.tag = row;
}
@end
