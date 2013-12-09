//
//  ContactList.m
//  Contact Editor
//
//  Created by Daniel Eggert on 02/12/2013.
//  Copyright (c) 2013 objc.io. All rights reserved.
//

#import "ContactList.h"

#import "Contact.h"
#import <vector>
#import <algorithm>



@implementation ContactList
{
    std::vector<__strong Contact *> _contacts;
}

+ (instancetype)sharedContactList;
{
    static ContactList *sharedList;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedList = [[ContactList alloc] init];
    });
    return sharedList;
}

- (id)init;
{
    self = [super init];
    if (self != nil) {
        [self insertRandomContacts];
    }
    return self;
}

- (void)insertRandomContacts;
{
    for (int i = 0; i < 42; ++i) {
        [self.contacts addObject:[Contact contactWithRancomName]];
    }
}

// We'll implement this through KVC
- (NSMutableOrderedSet *)contacts;
{
    return [self mutableOrderedSetValueForKey:@"backingContacts"];
}

//
// Note: This code is in no way a recommended implementation. It's merely meant as an
// example of what's possible, and how a custom implementation backing a KVC based
// collection proxy object would look like.
//

- (NSUInteger)countOfBackingContacts;
{
    return _contacts.size();
}

- (NSUInteger)indexInBackingContactsOfObject:(id)object;
{
    auto i = std::find(_contacts.cbegin(), _contacts.cend(), object);
    return (i == _contacts.cend()) ? NSNotFound : (i - _contacts.cbegin());
}

- (NSArray *)backingContactsAtIndexes:(NSIndexSet *)indexes;
{
    std::vector<Contact *> objects([indexes count], nil);
    __block auto it = objects.begin();
    [indexes enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
        *(it++) = _contacts[idx];
    }];
    return [NSArray arrayWithObjects:objects.data() count:objects.size()];
}

- (void)getBackingContacts:(id __unsafe_unretained [])buffer range:(NSRange)range;
{
    std::vector<Contact *> objects(range.length, nil);
    auto it1 = objects.begin();
    std::for_each(_contacts.cbegin() + range.location, _contacts.cbegin() + range.location + range.length, [&](Contact * const c){
        *(it1++) = c;
    });
}

- (void)insertBackingContacts:(NSArray *)array atIndexes:(NSIndexSet *)indexes;
{
    __block NSUInteger idx1 = 0;
    [indexes enumerateIndexesUsingBlock:^(NSUInteger idx2, BOOL *stop) {
        id object = array[idx1++];
        _contacts.insert(_contacts.begin() + idx2, object);
    }];
}

- (void)removeBackingContactsAtIndexes:(NSIndexSet *)indexes;
{
    [indexes enumerateRangesWithOptions:NSEnumerationReverse usingBlock:^(NSRange range, BOOL *stop) {
        _contacts.erase(_contacts.begin() + range.location, _contacts.begin() + range.location + range.length);
    }];
}

@end
