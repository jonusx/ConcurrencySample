//
//  menuView.m
//  Concurrency
//
//  Created by Mathew Cruz on 11/10/12.
//  Copyright (c) 2012 Cloud.com. All rights reserved.
//

#import "menuView.h"
#import "mainView.h"

@interface menuView ()

@end

@implementation menuView



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    mainView *mv = segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"NSOperation"]) {
        mv.myType = nsopType;
    }
    else if ([segue.identifier isEqualToString:@"GCD"]) {
        mv.myType = gcdType;
    }
    else if ([segue.identifier isEqualToString:@"Detach"]) {
        mv.myType = threadType;
    }
    else if ([segue.identifier isEqualToString:@"blocking"]) {
        mv.myType = blockingType;
    }
    
}

@end
