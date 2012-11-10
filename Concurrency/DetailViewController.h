//
//  DetailViewController.h
//  Concurrency
//
//  Created by Mathew Cruz on 11/10/12.
//  Copyright (c) 2012 Cloud.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
