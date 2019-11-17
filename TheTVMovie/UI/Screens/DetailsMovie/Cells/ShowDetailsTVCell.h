//
//  ShowDetailsTVCell.h
//  TheTVMovie
//
//  Created by George Vardikos on 17/11/19.
//  Copyright © 2019 George Vardikos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShowDetailsTVCell : UITableViewCell

@property (strong, nonatomic) UIImageView *backDropImage;
@property (strong, nonatomic) UILabel *showTitle;
@property (strong, nonatomic) UILabel *showSummary;
@property (strong, nonatomic) UILabel *genre;
@property (strong, nonatomic) AVPlayerViewController *playerViewController;

@property (class) NSString *reuseIdentifier;

@end

NS_ASSUME_NONNULL_END
