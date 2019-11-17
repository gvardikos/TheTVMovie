//
//  ShowDetailsView.m
//  TheTVMovie
//
//  Created by George Vardikos on 17/11/19.
//  Copyright © 2019 George Vardikos. All rights reserved.
//

#import "ShowDetailsView.h"

@implementation ShowDetailsView
    
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame: frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupTableView];
    }
    return self;
}

- (void) setupTableView {
    _detailsTableView = [[UITableView alloc] initWithFrame: CGRectZero
                                                     style: UITableViewStylePlain];
    _detailsTableView.backgroundColor = [UIColor whiteColor];
    [self addSubview: _detailsTableView];
    _detailsTableView.tableFooterView = [[UIView alloc] initWithFrame: CGRectZero];
    _detailsTableView.translatesAutoresizingMaskIntoConstraints = false;
    
    [_detailsTableView.topAnchor constraintEqualToAnchor: self.safeAreaLayoutGuide.topAnchor]
    .active = YES;
    [_detailsTableView.bottomAnchor constraintEqualToAnchor: self.safeAreaLayoutGuide.bottomAnchor]
    .active = YES;
    [_detailsTableView.leftAnchor constraintEqualToAnchor: self.safeAreaLayoutGuide.leftAnchor]
    .active = YES;
    [_detailsTableView.rightAnchor constraintEqualToAnchor: self.safeAreaLayoutGuide.rightAnchor]
    .active = YES;
}

@end
