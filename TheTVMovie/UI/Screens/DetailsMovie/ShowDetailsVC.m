//
//  ShowDetailsVC.m
//  TheTVMovie
//
//  Created by George Vardikos on 16/11/19.
//  Copyright © 2019 George Vardikos. All rights reserved.
//

#import "ShowDetailsVC.h"
#import "TheTVMovie-Swift.h"

@interface ShowDetailsVC ()
@property TVShowDetailsResponse *tvShowDTO;
@end

@implementation ShowDetailsVC

- (void) viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.contentView showBlurLoader];
    
    [Repository.shared fetchTVShowDetailsWithId: _showId
                                         result:^(TVShowDetailsResponse * response, NSError * error) {
        if (response) {
            self.tvShowDTO = response;
            [self.contentView.detailsTableView reloadData];
            [self.contentView removeBluerLoader];
        }
    }];
}

- (void) loadView {
    _contentView = [[ShowDetailsView alloc] initWithFrame: CGRectZero];
    self.view = _contentView;
}

- (void) setupTableView {
    [_contentView.detailsTableView registerClass: ShowDetailsTVCell.class
                          forCellReuseIdentifier: @"ShowDetailsTVCell.reuseIdentifier"];
    _contentView.detailsTableView.delegate = self;
    _contentView.detailsTableView.dataSource = self;
}

- (UITableViewCell *)tableView: (UITableView *)tableView
         cellForRowAtIndexPath: (NSIndexPath *)indexPath {
    ShowDetailsTVCell *cell = [_contentView.detailsTableView
                               dequeueReusableCellWithIdentifier: @"ShowDetailsTVCell.reuseIdentifier"
                                                    forIndexPath: indexPath];
    
    if (cell == nil) {
        cell = [[ShowDetailsTVCell alloc] initWithStyle: UITableViewCellStyleDefault
                                        reuseIdentifier: @"ShowDetailsTVCell.reuseIdentifier"];
    }
    
    if (_tvShowDTO) {
        [cell setTVShowDto: _tvShowDTO];
        [cell configure];
    }
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 450;
}

@end
