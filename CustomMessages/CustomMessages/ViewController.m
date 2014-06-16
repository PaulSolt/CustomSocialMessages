//
//  ViewController.m
//  CustomMessages
//
//  Created by Paul Solt on 6/16/14.
//  Copyright (c) 2014 Paul Solt. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSArray *_socialMessages;
}
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _socialMessages = [[NSMutableArray alloc] init];
    [self loadSocialMessages];
    self.messageLabel.text = [self randomSocialMessage];
}

- (void)loadSocialMessages {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"socialMessages.txt" ofType:nil];
    NSError *error = nil;
    NSString *fileContents = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    if(error) {
        NSLog(@"Unable to load social messages: %@", [error localizedDescription]);
    }
    _socialMessages = [fileContents componentsSeparatedByString:@"\n"];
}

- (NSString *)randomSocialMessage {
    NSString *message = nil;
    if(_socialMessages.count > 0) {
        int messageIndex = arc4random_uniform([_socialMessages count]);
        message = _socialMessages[messageIndex];
    }
    return message;
}

- (IBAction)nextButtonPressed:(id)sender {
    
    self.messageLabel.text = [self randomSocialMessage];
}

@end
