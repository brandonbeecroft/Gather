//
//  FirstExperienceViewController.m
//  Gather
//
//  Created by Brandon Beecroft on 10/21/14.
//  Copyright (c) 2014 Genealogist. All rights reserved.
//
#import <Parse/Parse.h>
#import "FirstExperienceViewController.h"
#import "InterfaceButtons.h"

@implementation FirstExperienceViewController

-(void)viewWillAppear:(BOOL)animated {
    //[[self navigationController] setNavigationBarHidden:NO animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    PFUser *currentUser = [PFUser currentUser];
    if (!currentUser) {
        [self performSegueWithIdentifier:@"showLogin" sender:self];
    }

    // temp
    self.hasData = YES;

    if (self.hasData) {
        [self performSegueWithIdentifier:@"showTimeline" sender:self];
    }


    NSLog(@"show first user experience");
    self.addPhotoLabel.textColor = [InterfaceButtons snowWhite];
    self.famFriendsBtn.textColor = [InterfaceButtons snowWhite];
    self.inviteFamFriendsLabel.textColor = [InterfaceButtons snowWhite];
}

#pragma mark - first user experience functions

- (IBAction)button:(id)sender {
    NSLog(@"add photo functionality");
    //UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Photos" message:@"So you want to add photos huh? Well it's coming. Be patient!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    //[alert show];
}

- (IBAction)findFamilyAndFriends:(id)sender {

    NSLog(@"find family and friends");
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Find Family" message:@"Like I said, it's coming! Be patient!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alert show];
}

- (IBAction)inviteFamilyFriends:(id)sender {
    NSLog(@"You want to invite others. Good for you!");
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invite" message:@"Invitations are so fun. Hopefully you will be able to invite someone soon." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alert show];
    
}



@end
