//
//  EDSViewController.m
//  MultipleCollectionViews
//
//  Created by Eduardo Diaz Sancha on 3/26/14.
//  Copyright (c) 2014 edsancha. All rights reserved.
//

#import "EDSViewController.h"
#import "EDSCollectionViewCell.h"

#define BUG_SOLUTION 0
@interface EDSViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) IBOutlet UICollectionView *firstCollectionView;
@property (strong, nonatomic) IBOutlet UICollectionView *secondCollectionView;
@property (strong, nonatomic) IBOutlet UICollectionView *thirdCollectionView;

@property (nonatomic, strong) UICollectionView* selectionBlockedCollectionView;
@property (nonatomic, assign) BOOL selectionBlocked;

@end

@implementation EDSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (collectionView == self.firstCollectionView) {
        return 10;
    } else if (collectionView == self.secondCollectionView) {
        return 15;
    } else if (collectionView == self.thirdCollectionView) {
        return 20;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    EDSCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];

    if (collectionView == self.firstCollectionView) {
        cell.defaultColor = [UIColor blueColor];
    } else if (collectionView == self.secondCollectionView) {
        cell.defaultColor = [UIColor greenColor];
    } else {
        cell.defaultColor = [UIColor redColor];
    }
    cell.backgroundColor = cell.defaultColor;
    cell.label.text = [NSString stringWithFormat:@"%li",indexPath.row];
    return cell;

}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {

    NSLog(@"%s", __PRETTY_FUNCTION__);

#if BUG_SOLUTION
    if (!self.selectionBlocked){
        self.selectionBlocked = YES;
        self.selectionBlockedCollectionView = collectionView;
        return YES;
    } else {
        return NO;
    }
#endif
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __PRETTY_FUNCTION__);
#if BUG_SOLUTION
    self.selectionBlocked = NO;
#endif
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __PRETTY_FUNCTION__);
#if BUG_SOLUTION
    return (self.selectionBlockedCollectionView == collectionView);
#endif
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __PRETTY_FUNCTION__);

#if BUG_SOLUTION
    self.selectionBlockedCollectionView = nil;
#endif

    [collectionView deselectItemAtIndexPath:indexPath animated:YES];

    UIViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"viewController"];

    if (collectionView == self.firstCollectionView) {
        viewController.title = @"From First CollectionView";
        viewController.view.backgroundColor = [UIColor blueColor];

    } else if (collectionView == self.secondCollectionView) {
        viewController.title = @"From Second CollectionView";
        viewController.view.backgroundColor = [UIColor greenColor];
    } else {
        viewController.title = @"From Third CollectionView";
        viewController.view.backgroundColor = [UIColor redColor];
    }

    [self.navigationController pushViewController:viewController animated:YES];

}

@end
