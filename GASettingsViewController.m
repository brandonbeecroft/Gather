//
//  GASettingsViewController.m
//  Gather
//
//  Created by Brandon Beecroft on 10/22/14.
//  Copyright (c) 2014 Genealogist. All rights reserved.
//

#import <Parse/Parse.h>
#import "GASettingsViewController.h"

@implementation GASettingsViewController

- (IBAction)logout:(id)sender {
    [PFUser logOut];
    [self performSegueWithIdentifier:@"showLogin" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showLogin"]) {
       [segue.destinationViewController setHidesBottomBarWhenPushed:YES];
    }
}

@end
