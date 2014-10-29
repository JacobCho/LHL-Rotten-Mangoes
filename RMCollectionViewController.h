//
//  RMCollectionViewController.h
//  Rotten Mangoes
//
//  Created by Jacob Cho on 2014-10-29.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

#define API_KEY @"f95nzzmyhj57sx8ds3as8cfu"
#define RT_URL @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey="

@interface RMCollectionViewController : UICollectionViewController


@property (strong, nonatomic) NSMutableArray *movies;

@end
