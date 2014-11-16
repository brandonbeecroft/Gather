//
//  InterfaceButtons.h
//  Gather
//
//  Created by Brandon Beecroft on 10/22/14.
//  Copyright (c) 2014 CompanyName. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface InterfaceButtons : NSObject

// iOS Controls Customization Outlets
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* photoTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* familyFriendsIconTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* inviteIconTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* timelineTargets;

// Colors
+ (UIColor*)snowWhite;

// Drawing Methods
+ (void)drawPhoto;
+ (void)drawFamilyFriendsIcon;
+ (void)drawInviteIcon;
+ (void)drawTimeline;

// Generated Images
+ (UIImage*)imageOfPhoto;
+ (UIImage*)imageOfFamilyFriendsIcon;
+ (UIImage*)imageOfInviteIcon;
+ (UIImage*)imageOfTimeline;

@end