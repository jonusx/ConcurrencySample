//
//  nsoperationChooser.m
//  Concurrency
//
//  Created by Mathew Cruz on 11/29/12.
//  Copyright (c) 2012 Cloud.com. All rights reserved.
//

#import "nsoperationChooser.h"
#import "mainView.h"

@interface nsoperationChooser ()

@end

@implementation nsoperationChooser

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    mainView *mv = segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"noQueue"]) {
        mv.myType = nsopType;
        mv.nsoperationMethod = noQueue;
    }
    else if ([segue.identifier isEqualToString:@"withQueue"]) {
        mv.myType = nsopType;
        mv.nsoperationMethod = withQueue;
    }
    else if ([segue.identifier isEqualToString:@"invocation"]) {
        mv.myType = nsopType;
        mv.nsoperationMethod = invocation;
    }
    else if ([segue.identifier isEqualToString:@"blockObject"]) {
        mv.myType = nsopType;
        mv.nsoperationMethod = blockObject;
    }
    else if ([segue.identifier isEqualToString:@"directBlock"]) {
        mv.myType = nsopType;
        mv.nsoperationMethod = rawBlock;
    }
    
}

@end
