//
//  Movie.m
//  Rotten Mangoes
//
//  Created by Jacob Cho on 2014-10-29.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import "Movie.h"

@implementation Movie

-(id) initWithTitle:(NSString *)title {
    self = [super init];
    
    if (self) {
        self.title = title;
        self.thumbnail = nil;
    }
    
    return self;
}

+ (id) movieWithTitle:(NSString *)title {
    return [[self alloc] initWithTitle:title];
}

- (NSURL *) detailPosterURL {
    
    NSString *detailPoster = [self.thumbnail stringByReplacingOccurrencesOfString:@"tmb" withString:@"det"];
    return [NSURL URLWithString:detailPoster];
}

- (NSString *) URLname {
    
    NSString *URLname = [self.title stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    return URLname;
}

@end
