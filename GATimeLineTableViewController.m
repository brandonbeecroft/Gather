//
//  GATimeLineTableViewController.m
//  Gather
//
//  Created by Brandon Beecroft on 10/3/14.
//  Copyright (c) 2014 Genealogist. All rights reserved.
//
#import <Parse/Parse.h>
#import "GATimeLineTableViewController.h"
#import "TimelineTableViewCell.h"

@interface GATimeLineTableViewController () <UITableViewDataSource, UITableViewDelegate>


@end

@implementation GATimeLineTableViewController

-(void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    self.navigationItem.hidesBackButton = YES;

}

- (void)viewDidLoad {
    [super viewDidLoad];

    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        NSLog(@"current user: %@", currentUser.username);
    } else {
        [self performSegueWithIdentifier:@"showLogin" sender:self];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TimelineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"timelineCell" forIndexPath:indexPath];

    //cell.textLabel.text = @"Artifact will be here";
    tableView.rowHeight = 380;
    //tableView.estimatedRowHeight = 380;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    // TEMP DATA
    switch (indexPath.row) {
        case 0:
            cell.timeAgo.text = @"10m";
            cell.postText.text = @"The tires skidded on the wet tarmac, the plane lurched to an ungainly halt, and guests jostled in their seats, impatient to disembark. It was with trepidation, excitement, and intense curiosity that I nosed the miniature car from the safety of the airport rental lot, out into a tapestry of interconnected roundabouts, lights, slip lanes, and sadly, oncoming traffic.";

            break;

        case 1:
            cell.timeAgo.text = @"1d";
            cell.postText.text = @"Like a cougar that must kill frequently to satiate it's appetite (and more importantly provide fresh meat, the burden of any obligate carnivore), the life of the humming bird flutters around the most basic level of existence.";
            cell.postImage.image = [UIImage imageNamed:@"tempic2.png"];
            cell.profilePic.image = [UIImage imageNamed:@"profilePic2.png"];
            cell.nameOfContributor.text = @"Gerald Wallace";
            cell.numberOfComments.text = @"101";
            cell.numberOfFavoritesLabel.text = @"2";
            break;

        default:
            break;
    }

    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showLogin"]) {
        [segue.destinationViewController setHidesBottomBarWhenPushed:YES];
    }
}
@end
