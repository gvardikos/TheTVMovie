//
//  ShowDetailsVC.h
//  TheTVMovie
//
//  Created by George Vardikos on 16/11/19.
//  Copyright © 2019 George Vardikos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowDetailsView.h"
#import "ShowDetailsTVCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ShowDetailsVC : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) ShowDetailsView *contentView;
@property (strong, nonatomic) NSString *showId;

@end

NS_ASSUME_NONNULL_END
