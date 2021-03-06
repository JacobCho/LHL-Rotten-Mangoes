//
//  ReviewsViewController.m
//  Rotten Mangoes
//
//  Created by Jacob Cho on 2014-10-29.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import "ReviewsViewController.h"
#import "WebViewController.h"
#import "TheatresMapViewController.h"

@interface ReviewsViewController ()

@end

@implementation ReviewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadReviews];
    [self setUpViews];

}

-(void)loadReviews {
    NSString *URLwithID = [NSString stringWithFormat:REVIEWS_URL, self.movie.idNumber];
    NSString *URL = [URLwithID stringByAppendingString:API_KEY];
    NSString *extendedURL = [URL stringByAppendingString:@"&page_limit=3"];
    
    NSURL *reviewsURL = [NSURL URLWithString:extendedURL];
    
    NSData *data = [NSData dataWithContentsOfURL:reviewsURL];
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    self.reviews = [NSMutableArray array];
    
    NSArray *reviewsArray = [dataDictionary objectForKeyedSubscript:@"reviews"];
    
    
    for (NSDictionary *reviewsDictionary in reviewsArray) {
        
        Review *review = [[Review alloc] init];
        review.critic = [reviewsDictionary objectForKey:@"critic"];
        review.publication = [reviewsDictionary objectForKey:@"publication"];
        review.quote = [reviewsDictionary objectForKey:@"quote"];
        
        if (review == nil) {
            
            NSNull *nullObject = [[NSNull alloc] init];
            [self.reviews addObject:nullObject];
        } else {
        
        [self.reviews addObject:review];
        }
        
    }

}

-(void)setUpViews {
    
    if (self.reviews == nil || [self.reviews count] == 0) {
        self.criticLabel1.text = @"";
        self.publicationLabel1.text = @"";
        self.quoteLabel1.text = @"";

        self.criticLabel2.text = @"";
        self.publicationLabel2.text = @"";
        self.quoteLabel2.text = @"";

        self.criticLabel3.text = @"";
        self.publicationLabel3.text = @"";
        self.quoteLabel3.text = @"";

    } else {
    
    Review *review1 = self.reviews[0];
    self.criticLabel1.text = review1.critic;
    self.publicationLabel1.text = review1.publication;
    self.quoteLabel1.text = review1.quote;
    
    Review *review2 = self.reviews[1];
    self.criticLabel2.text = review2.critic;
    self.publicationLabel2.text = review2.publication;
    self.quoteLabel2.text = review2.quote;
    
    Review *review3 = self.reviews[2];
    self.criticLabel3.text = review3.critic;
    self.publicationLabel3.text = review3.publication;
    self.quoteLabel3.text = review3.quote;
    }
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"showWebViewSegue"]) {
        
        WebViewController *WVC = segue.destinationViewController;
        WVC.movie = self.movie;
        
    } else if ([[segue identifier] isEqualToString:@"showTheatresSegue"]) {
        TheatresMapViewController *theatres = segue.destinationViewController;
        theatres.movie = self.movie;
        
    }
    
}

- (IBAction)siteBarButtonItemPressed:(UIBarButtonItem *)sender {
}
@end
