//
//  DetailViewController.h
//  Contact Editor
//
//  Created by Daniel Eggert on 01/12/2013.
//  Copyright (c) 2013 objc.io. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Contact;



@interface DetailViewController : UITableViewController

@property (nonatomic, strong) Contact *contact;

@end
