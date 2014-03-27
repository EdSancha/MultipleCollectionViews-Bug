//
//  EDSCollectionViewCell.m
//  MultipleCollectionViews
//
//  Created by Eduardo Diaz Sancha on 3/26/14.
//  Copyright (c) 2014 edsancha. All rights reserved.
//

#import "EDSCollectionViewCell.h"

@implementation EDSCollectionViewCell

- (void) setHighlighted:(BOOL)highlighted {
    self.statusLabel.text = highlighted?@"Highlighted":@"Normal";
}

- (void) setSelected:(BOOL)selected {
    self.statusLabel.text = selected?@"Selected":@"Normal";

    self.backgroundColor = selected?[UIColor grayColor]:self.defaultColor;
}

@end
