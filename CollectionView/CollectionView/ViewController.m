//
//  ViewController.m
//  CollectionView
//
//  Created by Cocoa Lee on 15/8/6.
//  Copyright (c) 2015年 Cocoa Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    
    UICollectionView *collectView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];

    [collectView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    collectView.backgroundColor = [UIColor colorWithRed:240/250.0 green:240/250.0 blue:240/250.0 alpha:1];
    
    collectView.dataSource = self;
    collectView.delegate = self;
    [self.view addSubview:collectView];
    
    

    
    
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
 
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"cell";
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
    
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
    
    
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:cell.bounds];
    
    cell.layer.masksToBounds = NO;
    
    cell.layer.shadowColor = cell.backgroundColor.CGColor;
    
    cell.layer.shadowOffset = CGSizeMake(0.0f, 5.0f);
    
    cell.layer.shadowOpacity = 0.5f;
    
    cell.layer.shadowPath = shadowPath.CGPath;
    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((CGRectGetWidth(self.view.bounds)-60)/2.0, 200);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(20, 20, 20, 20);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"  ---%ld",indexPath.row);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
