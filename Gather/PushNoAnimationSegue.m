//
//  PushNoAnimationSegue.m
//  TestLogin
//
//  Created by Brandon Beecroft on 10/2/14.
//  Copyright (c) 2014 Genealogist. All rights reserved.
//

#import "PushNoAnimationSegue.h"

@implementation PushNoAnimationSegue

-(void) perform {

    [[[self sourceViewController] navigationController] pushViewController:[self destinationViewController] animated:NO];

}

@end
