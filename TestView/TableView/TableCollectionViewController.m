//
//  TableCollectionViewController.m
//  TestView
//
//  Created by Jack KY Chen on 2017/4/18.
//  Copyright © 2017年 Jack KY Chen. All rights reserved.
//

#import "TableCollectionViewController.h"
#import "CollectionTableViewCell.h"
#import "LabelCollectionViewCell.h"

static const int rowCount = 10;

@interface TableCollectionViewController ()


@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *datas;
@property (strong, nonatomic) NSMutableArray *collectionViewOffsets;
@property (strong, nonatomic) NSMutableArray *imageDatas;


@end

@implementation TableCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.datas = [self fakeData];
    self.collectionViewOffsets = [self fakeOffset];
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSArray*)fakeData{
    NSMutableArray *arr = [NSMutableArray new];
    
    for (int i = 0; i < rowCount; i++) {
        NSMutableArray *colors = [NSMutableArray new];
        for (int j = 0; j < 15; j++) {
            CGFloat red = arc4random_uniform(255)/255.0;
            CGFloat green = arc4random_uniform(255)/255.0;
            CGFloat blue = arc4random_uniform(255)/255.0;
            
            UIColor *cr = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
            [colors addObject:cr];
        }
        [arr addObject:colors];
    }
    return arr;
}

-(NSMutableArray*)fakeOffset{
    NSMutableArray *arr = [NSMutableArray new];
    
    for (int i = 0; i < rowCount; i++) {
        [arr addObject:@0];
    }
    
    return arr;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Table Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CollectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CollectCell" forIndexPath:indexPath];
    [cell setCollectionViewWithDelegate:self row:indexPath.row];
    [cell.collectionView reloadData];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    self.collectionViewOffsets[indexPath.row] = [NSNumber numberWithFloat:((CollectionTableViewCell*)cell).collectionView.contentOffset.x];
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    [((CollectionTableViewCell*)cell).collectionView setContentOffset:CGPointMake(((NSNumber*)self.collectionViewOffsets[indexPath.row]).floatValue, 0)];
}
#pragma mark - Collection Delegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return ((NSArray*)self.datas[collectionView.tag]).count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LabelCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LabelCell" forIndexPath:indexPath];
    cell.labelMain.text = [NSString stringWithFormat:@"%li", indexPath.row];
    cell.backgroundColor = self.datas[collectionView.tag][indexPath.row];
    return cell;
}

#pragma mark - async fetch
-(void)fetchImageFromURL:(NSURL*)url forRow:(NSInteger)row{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        self.imageDatas[row] = image;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    });
}

@end
