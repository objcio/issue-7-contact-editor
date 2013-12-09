//
//  ContactList.h
//  Contact Editor
//
//  Created by Daniel Eggert on 02/12/2013.
//  Copyright (c) 2013 objc.io. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ContactList : NSObject

+ (instancetype)sharedContactList;

@property (readonly, nonatomic, strong) NSMutableOrderedSet *contacts;

@end
