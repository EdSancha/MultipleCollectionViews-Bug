//
//  EDSCollectionViewCell.h
//  MultipleCollectionViews
//
//  Created by Eduardo Diaz Sancha on 3/26/14.
//  Copyright (c) 2014 edsancha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EDSCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIColor *defaultColor;
@property (strong, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;

@end
