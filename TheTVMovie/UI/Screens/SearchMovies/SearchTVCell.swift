//
//  SearchTVCell.swift
//  TheTVMovie
//
//  Created by George Vardikos on 16/11/19.
//  Copyright © 2019 George Vardikos. All rights reserved.
//

import Stevia

private let padding: CGFloat = 12

private let posterImageViewWidth: CGFloat = 100
private let posterImageViewHeight: CGFloat = 100

private let showTitleLabelWidth: CGFloat = 150
private let showTitleLabelHeight: CGFloat = 21

private let releaseLabelWidth: CGFloat = 150
private let releaseLabelHeight: CGFloat = 21

private let voteLabelWidth: CGFloat = 50
private let voteLabelHeight: CGFloat = 21

final class SearchTVCell: BaseTVCell {
    lazy var posterImageView: UIImageView = { [unowned self] in
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        return imageView
    }()
    
    lazy var showTitleLabel: UILabel = { [unowned self] in
        let label = UILabel()
        label.text = "Picky Blinders"
        return label
    }()
    
    lazy var voteAverageLabel: UILabel = { [unowned self] in
        let label = UILabel()
        label.text = "4.8/5"
        return label
    }()
    
    lazy var releaseDate: UILabel = { [unowned self] in
        let label = UILabel()
        label.text = "2003-09-21"
        return label
    }()
    
    override func setupCell() {        
        sv([posterImageView, showTitleLabel, voteAverageLabel, releaseDate])
        
        posterImageView.Top == Top + padding
        posterImageView.Left == Left + padding
        posterImageView.width(posterImageViewWidth).height(posterImageViewHeight)
        
        showTitleLabel.Left == Left + padding
        showTitleLabel.Top == posterImageView.Bottom
        showTitleLabel.width(showTitleLabelWidth).height(showTitleLabelHeight)
        
        releaseDate.Left == posterImageView.Right + padding
        releaseDate.Top == Top + padding
        releaseDate.width(releaseLabelWidth).height(releaseLabelHeight)
        
        voteAverageLabel.Left == posterImageView.Right + padding
        voteAverageLabel.Top == releaseDate.Bottom + padding
        voteAverageLabel.width(voteLabelWidth).height(voteLabelHeight)
        
    }
}

