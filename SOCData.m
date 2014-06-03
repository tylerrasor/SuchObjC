//
//  SOCData.m
//  SuchObjC
//
//  Created by tyler on 6/3/14.
//  Copyright (c) 2014 Tyler Rasor. All rights reserved.
//

#import "SOCData.h"

@interface SOCData ()

@property (strong, nonatomic) NSArray *adjectives;
@property (strong, nonatomic) NSArray *nouns;
@property (nonatomic) int counter;

@end

@implementation SOCData

- (instancetype)init
{
    self = [super init];
    if (self) {
        _adjectives = @[@"such ", @"very ", @"much ", @"so "];
        _nouns = @[@"xcode", @"app", @"obj-c"];
    }
    return self;
}

- (NSString *)randomItem
{
    self.counter++;
    int adjIndex = arc4random() % [self.adjectives count];
    int nounIndex = arc4random() % [self.nouns count];
    
    NSMutableString *randString = [[NSMutableString alloc] init];
    if (self.counter % 5 == 0){
        [randString appendString:@"wow"];
    } else {
        [randString appendString:self.adjectives[adjIndex]];
        [randString appendString:self.nouns[nounIndex]];
    }
    
    return [randString copy];
}

@end
