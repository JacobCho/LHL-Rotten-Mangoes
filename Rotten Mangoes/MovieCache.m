//
//  MovieCache.m
//  Rotten Mangoes
//
//  Created by Jacob Cho on 2014-10-30.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import "MovieCache.h"

@implementation MovieCache

-(instancetype)initMovieCacheWithSize:(int)newSize {
    self = [super init];
    
    if (self) {
        self.size = newSize;
        self.counter = 0;
        // initialize the dictionary
        self.posterImages = [[NSMutableDictionary alloc] initWithCapacity:newSize];
    }
    
    return self;
}

-(BOOL)containsMovieWithIdNumber:(NSString *)idNumber {
    
    for (NSString *key in [self.posterImages allKeys]) {
        
        if ([idNumber isEqualToString:key]) {
            
            return YES;
        }
        else {
            return NO;
        }
    }
    
    return NO;
    
}

-(void)cacheMovie:(Movie *)movie withPoster:(UIImage *)posterImage {
    // check if cache is full
    
    if ([self.posterImages count] == self.size) {
        NSArray *keysArray = [[NSArray alloc] initWithArray:[self.posterImages allKeys]];
        [self.posterImages removeObjectForKey:[keysArray objectAtIndex:self.counter]];
        [self.posterImages setObject:posterImage forKey:movie.idNumber];
        if (self.counter == 4) {
            self.counter = 0;
        } else {
            self.counter++;
        }
        
    }
    [self.posterImages setObject:posterImage forKey:movie.idNumber];
    // if not, create a new entry of idNumber:posterImage
    
}

-(UIImage *)posterImageWithIdNumber:(NSString *)idNumber {
    // search your dictionary using the provided idNumber
    
    for (NSString *key in [self.posterImages allKeys]) {
        
        if ([key isEqualToString:idNumber]) {
            
            UIImage *poster = [self.posterImages objectForKey:key];
            return poster;
        }
        
    }
    // return found image
    return nil;
}

@end
