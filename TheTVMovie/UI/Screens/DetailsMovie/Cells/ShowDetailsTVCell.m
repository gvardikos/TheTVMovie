//
//  ShowDetailsTVCell.m
//  TheTVMovie
//
//  Created by George Vardikos on 17/11/19.
//  Copyright © 2019 George Vardikos. All rights reserved.
//

#import "ShowDetailsTVCell.h"
#import "TheTVMovie-Swift.h"

@interface ShowDetailsTVCell ()
@property TVShowDetailsResponse *tvShowDTO;
@end

@implementation ShowDetailsTVCell

static NSString * _reuseIdentifier = @"ShowDetailsTVCell.reuseIdentifier";
+ (NSString *) reuseIdentifier { return _reuseIdentifier; }

- (void) setTVShowDto:(NSObject *) dto {
    self.tvShowDTO = dto;
}

- (instancetype) initWithStyle: (UITableViewCellStyle)style
               reuseIdentifier: (NSString *)reuseIdentifier {
    self = [super initWithStyle: style reuseIdentifier: reuseIdentifier];
   
    [self setupUI];
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) configure {
    if (_tvShowDTO.backdropPath) {
    [_backDropImage loadImageWithPath: [@"https://image.tmdb.org/t/p/w500/" stringByAppendingString: _tvShowDTO.backdropPath]
                         defaultImage:nil
                             cacheKey:nil];
    }
    _showTitle.text = _tvShowDTO.showTitle;
    _showSummary.text = _tvShowDTO.showSummary;
    
    if (_tvShowDTO.genre.count > 0) {
        _genre.text = _tvShowDTO.genre[0].name;
    }
}

- (void) setupUI {
    _backDropImage = [[UIImageView alloc] initWithFrame: CGRectZero];
    _backDropImage.backgroundColor = [UIColor whiteColor];
    _backDropImage.contentMode = UIViewContentModeScaleAspectFit;
    
    _showTitle = [[UILabel alloc] initWithFrame: CGRectZero];
    _showTitle.text = @"title";
    _showTitle.textAlignment = NSTextAlignmentCenter;
    _showTitle.minimumScaleFactor = 0.5;
    
    _showSummary = [[UILabel alloc] initWithFrame: CGRectZero];
    _showSummary.text = @"On behalf of \"oppressed bugs everywhere,\" an inventive ant named Flik hires a troupe of warrior bugs to defend his bustling colony from a horde of freeloading grasshoppers led by the evil-minded Hopper.";
    _showSummary.numberOfLines = 0;
    _showSummary.textAlignment = NSTextAlignmentCenter;
    _showSummary.minimumScaleFactor = 0.5;
    
    _genre = [[UILabel alloc] initWithFrame: CGRectZero];
    _genre.text = @"NA";
    _genre.textAlignment = NSTextAlignmentCenter;
    _genre.minimumScaleFactor = 0.5;
    
    [self addSubview: _backDropImage];
    [self addSubview: _showTitle];
    [self addSubview: _showSummary];
    [self addSubview: _genre];
    
    _backDropImage.translatesAutoresizingMaskIntoConstraints = false;
    _showTitle.translatesAutoresizingMaskIntoConstraints = false;
    _showSummary.translatesAutoresizingMaskIntoConstraints = false;
    _genre.translatesAutoresizingMaskIntoConstraints = false;
    
    [_backDropImage.widthAnchor constraintEqualToAnchor: self.widthAnchor
                                             multiplier: 1.0].active = YES;
    [_backDropImage.heightAnchor constraintEqualToConstant:150].active = YES;
    [_backDropImage.topAnchor constraintEqualToAnchor: self.topAnchor
                                             constant: 12].active = YES;
    [_backDropImage.centerXAnchor constraintEqualToAnchor: self.centerXAnchor
                                                 constant: 0.0].active = YES;
    
    [_showTitle.widthAnchor constraintEqualToAnchor: self.widthAnchor
                                         multiplier: 1.0].active = YES;
    [_showTitle.heightAnchor constraintEqualToConstant: 21].active = YES;
    [_showTitle.topAnchor constraintEqualToAnchor: _backDropImage.bottomAnchor
                                         constant: 12.0].active = YES;
    [_showTitle.centerXAnchor constraintEqualToAnchor: self.centerXAnchor
                                             constant: 0.0].active = YES;
    
    [_showSummary.widthAnchor constraintEqualToAnchor: self.widthAnchor
                                           multiplier: 1.0].active = YES;
    [_showSummary.heightAnchor constraintEqualToConstant: 200].active = YES;
    [_showSummary.topAnchor constraintEqualToAnchor: _showTitle.bottomAnchor
                                           constant: 12.0].active = YES;
    [_showSummary.centerXAnchor constraintEqualToAnchor: self.centerXAnchor
                                               constant: 0.0].active = YES;
    
    [_genre.widthAnchor constraintEqualToAnchor: self.widthAnchor
                                     multiplier: 1.0].active = YES;
    [_genre.heightAnchor constraintEqualToConstant: 21].active = YES;
    [_genre.topAnchor constraintEqualToAnchor: _showSummary.bottomAnchor
                                     constant: 12.0].active = YES;
    [_genre.centerXAnchor constraintEqualToAnchor: self.centerXAnchor
                                         constant: 0.0].active = YES;
    
}

@end
