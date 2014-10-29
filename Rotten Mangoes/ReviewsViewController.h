//
//  ReviewsViewController.h
//  Rotten Mangoes
//
//  Created by Jacob Cho on 2014-10-29.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
#import "Review.h"

#define API_KEY @"f95nzzmyhj57sx8ds3as8cfu"
#define REVIEWS_URL @"http://api.rottentomatoes.com/api/public/v1.0/movies/%@/reviews.json?apikey="

@interface ReviewsViewController : UIViewController

@property (strong, nonatomic) Movie *movie;
@property (strong, nonatomic) NSMutableArray *reviews;

@property (weak, nonatomic) IBOutlet UILabel *criticLabel1;
@property (weak, nonatomic) IBOutlet UILabel *publicationLabel1;
@property (weak, nonatomic) IBOutlet UILabel *quoteLabel1;

@property (weak, nonatomic) IBOutlet UILabel *criticLabel2;
@property (weak, nonatomic) IBOutlet UILabel *publicationLabel2;
@property (weak, nonatomic) IBOutlet UILabel *quoteLabel2;

@property (weak, nonatomic) IBOutlet UILabel *criticLabel3;
@property (weak, nonatomic) IBOutlet UILabel *publicationLabel3;
@property (weak, nonatomic) IBOutlet UILabel *quoteLabel3;

@end
