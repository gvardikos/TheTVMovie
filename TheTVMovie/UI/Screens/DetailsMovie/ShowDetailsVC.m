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

@end

@implementation ShowDetailsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@", _name);
}

- (void)loadView {
    ShowDetailsView *contentView = [[ShowDetailsView alloc] initWithFrame: CGRectZero];
    self.view = contentView;
}

@end
