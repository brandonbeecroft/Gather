//
//  GALoginViewController.m
//  Gather
//
//  Created by Brandon Beecroft on 10/3/14.
//  Copyright (c) 2014 Genealogist. All rights reserved.
//
#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>

#import "GALoginViewController.h"
#import "GASignupViewController.h"

@interface GALoginViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *emailAddress;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation GALoginViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:YES animated:NO];

    self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];

    self.emailAddress.delegate = self;
    self.password.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.navigationController.navigationBarHidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginIn:(id)sender {
    NSLog(@"check login");

    NSString *providedEmail = self.emailAddress.text;
    NSString *providedPassword = self.password.text;

    [PFUser logInWithUsernameInBackground:providedEmail password:providedPassword block:^(PFUser *user, NSError *error) {
        if (error) {
            NSLog(@"there was an error");
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login Error" message:@"Either the email address or password was not valid." delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
            [alert show];
        } else {
            //[self dismissViewControllerAnimated:YES completion:nil];
            [PFUser logInWithUsernameInBackground:providedEmail password:providedPassword block:^(PFUser *user, NSError *error) {
                if (error) {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login error" message:@"error" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
                    [alert show];
                }
            }];
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
    }];
}

- (IBAction)facebookLogin:(id)sender {
    [PFFacebookUtils logInWithPermissions:nil block:^(PFUser *user, NSError *error) {
        if (!user) {
            NSLog(@"Uh oh. The user cancelled the Facebook login.");
        } else if (user.isNew) {
            NSLog(@"User signed up and logged in through Facebook!");
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Facebook Login" message:@"Signed up and logged in through facebook" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
            [alert show];
            [self dismissViewControllerAnimated:NO completion:nil];
        } else {
            NSLog(@"User logged in through Facebook!");
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Facebook Login" message:@"Signed up and logged in through facebook" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
            [alert show];
            [self.navigationController popToRootViewControllerAnimated:NO];

            //            if (![PFFacebookUtils isLinkedWithUser:user]) {
            //                [PFFacebookUtils linkUser:user permissions:nil block:^(BOOL succeeded, NSError *error) {
            //                    if (succeeded) {
            //                        NSLog(@"Woohoo, user logged in with Facebook!");
            //                    }
            //                }];
            //            }
        }
    }];
}

- (IBAction)forgotPassword:(id)sender {
    NSLog(@"forgot password tapped");
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    //[segue.destinationViewController setNavigationBarHidden:NO];
    NSLog(@"prepare for segue initiated");
}


@end
