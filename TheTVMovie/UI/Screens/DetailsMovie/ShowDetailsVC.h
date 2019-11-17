//
//  ShowDetailsVC.h
//  TheTVMovie
//
//  Created by George Vardikos on 16/11/19.
//  Copyright © 2019 George Vardikos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowDetailsView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ShowDetailsVC : UIViewController

@property (strong, nonatomic) ShowDetailsView *showDetailsView;
@property (strong, nonatomic) NSString *name;


@end

NS_ASSUME_NONNULL_END
