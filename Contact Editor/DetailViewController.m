//
//  DetailViewController.m
//  Contact Editor
//
//  Created by Daniel Eggert on 01/12/2013.
//  Copyright (c) 2013 objc.io. All rights reserved.
//

#import "DetailViewController.h"

#import "Contact.h"



@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *nicknameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *cityField;

@end



@implementation DetailViewController

- (void)viewWillAppear:(BOOL)animated;
{
    [super viewWillAppear:animated];
    [self updateTextFields];
}

- (NSArray *)contactStringKeys;
{
    return @[@"name", @"nickname", @"email", @"city"];
}

- (UITextField *)textFieldForModelKey:(NSString *)key;
{
    return [self valueForKey:[key stringByAppendingString:@"Field"]];
}

- (void)setContact:(Contact *)contact
{
    _contact = contact;
    [self updateTextFields];
}

- (void)updateTextFields;
{
    for (NSString *key in self.contactStringKeys) {
        [self textFieldForModelKey:key].text = [self.contact valueForKey:key];
    }
}

- (IBAction)fieldEditingDidEnd:(UITextField *)sender
{
    for (NSString *key in self.contactStringKeys) {
        UITextField *field = [self textFieldForModelKey:key];
        if (field == sender) {
            id value = sender.text;
            NSError *error = nil;
            if ([self.contact validateValue:&value forKey:key error:&error]) {
                [self.contact setValue:value forKey:key];
            } else {
                // Should present this to the user:
                NSLog(@"Error: %@", error);
            }
            sender.text = value;
            break;
        }
    }
}

@end
