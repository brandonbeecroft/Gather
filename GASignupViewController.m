//
//  GASignupViewController.m
//  Gather
//
//  Created by Brandon Beecroft on 10/3/14.
//  Copyright (c) 2014 Genealogist. All rights reserved.
//
#import <Parse/Parse.h>

#import "GASignupViewController.h"

@interface GASignupViewController ()

@property (weak, nonatomic) IBOutlet UITextField *emailAddress;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation GASignupViewController

-(void)viewWillAppear:(BOOL)animated {

    //[[self navigationController] setNavigationBarHidden:YES animated:NO];
//    self.navigationController.navigationBar.hidden = NO;
//    self.title = @"Registration";
//
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
//                             forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.shadowImage = [UIImage new];
//    self.navigationController.navigationBar.translucent = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [[UINavigationBar appearance] setTitleTextAttributes:
//     [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],
//      NSForegroundColorAttributeName,[UIFont fontWithName:@"Avenir-next" size:14],
//      NSFontAttributeName,nil]];

}

- (IBAction)signUpNewUser:(id)sender {
    NSString *email = [self.emailAddress.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.password.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSLog(@"email is: %@", email);
    if (email == nil || password == nil ){
        NSLog(@"%lu", (unsigned long)[email length]);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Fields can't be blank" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    } else {
        PFUser *newUser = [PFUser user];
        newUser.username = email;
        newUser.email = email;
        newUser.password = password;

        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (error) {
                NSLog(@"There was an error. post alert here.");
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[error.userInfo objectForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [alert show];
            } else {
                NSLog(@"Saved!");
                //[[[self presentingViewController] presentingViewController] dismissViewControllerAnimated:YES completion:nil];
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
        }];
    }
}

- (IBAction)addProfilePic:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Coming Soon!" message:@"This has not been developed yet. It is coming soon!" delegate:self cancelButtonTitle:@"ok" otherButtonTitles: nil];
    [alert show];
}

@end
