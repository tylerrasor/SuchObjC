//
//  SOCViewController.m
//  SuchObjC
//
//  Created by tyler on 6/3/14.
//  Copyright (c) 2014 Tyler Rasor. All rights reserved.
//

#import "SOCViewController.h"
#import "SOCData.h"

@interface SOCViewController ()

@property (strong, nonatomic) SOCData *labels;

@end

@implementation SOCViewController

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _labels = [[SOCData alloc] init];
        [self drawLabel:@"wow"];
    }
    return self;
}

- (void)loadView
{
    CGRect frame = [UIScreen mainScreen].bounds;
    UIView *backgroundView = [[UIView alloc] initWithFrame:frame];
    
    self.view = backgroundView;
}

- (void)drawLabel:(NSString *)text
{
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [self randomColor];
    label.font = [UIFont fontWithName:@"Chalkduster" size:16];
    label.text = text;
    
    [label sizeToFit];
    
    int width = (int)(self.view.bounds.size.width - label.bounds.size.width);
    int xPosition = arc4random() % width;
    int height = (int)(self.view.bounds.size.height - label.bounds.size.height);
    int yPosition = arc4random() % height;
    
    CGRect frame = label.frame;
    frame.origin = CGPointMake(xPosition, yPosition);
    label.frame = frame;
    
    [self.view addSubview:label];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self drawLabel:[self.labels randomItem]];
}

- (UIColor *)randomColor
{
    float red = (arc4random() % 100) / 100.0;
    float green = (arc4random() % 100) / 100.0;
    float blue = (arc4random() % 100) / 100.0;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

@end
