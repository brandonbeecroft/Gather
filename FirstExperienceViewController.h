//
//  FirstExperienceViewController.h
//  Gather
//
//  Created by Brandon Beecroft on 10/21/14.
//  Copyright (c) 2014 Genealogist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstExperienceViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *addPhotoLabel;
@property (weak, nonatomic) IBOutlet UILabel *famFriendsBtn;
@property (weak, nonatomic) IBOutlet UILabel *inviteFamFriendsLabel;

@property (weak, nonatomic) IBOutlet UIButton *logoutBtn;
@property (assign, nonatomic) BOOL hasData;

@end
