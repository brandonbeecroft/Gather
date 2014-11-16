//
//  TimelineTableViewCell.h
//  Gather
//
//  Created by Brandon Beecroft on 10/16/14.
//  Copyright (c) 2014 Genealogist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimelineTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *profilePic;
@property (weak, nonatomic) IBOutlet UILabel *nameOfContributor;
@property (weak, nonatomic) IBOutlet UILabel *timeAgo;
@property (weak, nonatomic) IBOutlet UIImageView *postImage;
@property (weak, nonatomic) IBOutlet UILabel *postText;
@property (weak, nonatomic) IBOutlet UILabel *numberOfFavoritesLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfComments;

@end
