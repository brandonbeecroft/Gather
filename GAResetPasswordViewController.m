//
//  GAResetPasswordViewController.m
//  Gather
//
//  Created by Brandon Beecroft on 10/3/14.
//  Copyright (c) 2014 Genealogist. All rights reserved.
//
#import <Parse/Parse.h>
#import "GAResetPasswordViewController.h"

@interface GAResetPasswordViewController ()

@property (weak, nonatomic) IBOutlet UITextField *resetPasswordTextfield;

@end

@implementation GAResetPasswordViewController

-(void)viewWillAppear:(BOOL)animated {
    //[[self navigationController] setNavigationBarHidden:YES animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)resetPassword:(id)sender {
    if (self.resetPasswordTextfield) {
        [PFUser requestPasswordResetForEmailInBackground:self.resetPasswordTextfield.text block:^(BOOL succeeded, NSError *error) {
            if (error) {
                UIAlertView *requestAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:[error.userInfo objectForKey:@"error"] delegate:self cancelButtonTitle:@"ok" otherButtonTitles: nil];
                [requestAlert show];
            }
        }];
    }
    else {
        UIAlertView *requestAlert = [[UIAlertView alloc] initWithTitle:@"Password Reset" message:@"Please provide a valid email address" delegate:self cancelButtonTitle:@"ok" otherButtonTitles: nil];
        [requestAlert show];
    }
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
