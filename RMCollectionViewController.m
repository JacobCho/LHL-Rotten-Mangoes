//
//  RMCollectionViewController.m
//  Rotten Mangoes
//
//  Created by Jacob Cho on 2014-10-29.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import "RMCollectionViewController.h"
#import "RMCollectionViewCell.h"
#import "ReviewsViewController.h"

@interface RMCollectionViewController ()

@end

@implementation RMCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
   
    [self loadMovies];

}

-(void)loadMovies {
    NSString *URL = [RT_URL stringByAppendingString:API_KEY];
    NSString *extendedURL = [URL stringByAppendingString:@"&page_limit=50"];
    
    NSURL *rtURL = [NSURL URLWithString:extendedURL];
//    NSData *data = [NSData dataWithContentsOfURL:rtURL];
//    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    NSURLSessionConfiguration *sessionConfig =
    [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *session =
    [NSURLSession sessionWithConfiguration:sessionConfig
                                  delegate:self
                             delegateQueue:nil];
    
    NSURLSessionDownloadTask *getImageTask =
    [session downloadTaskWithURL:rtURL
     
               completionHandler:^(NSURL *URL,
                                   NSURLResponse *response,
                                   NSError *error) {
                   // 2
                   NSData *data = [NSData dataWithContentsOfURL:URL];
                   NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                   
                    self.movies = [NSMutableArray array];
                   
                    NSArray *moviesArray = [dataDictionary objectForKeyedSubscript:@"movies"];
                   
                   
                   for (NSDictionary *moviesDictionary in moviesArray) {
                       
                       Movie *movie = [Movie movieWithTitle:[moviesDictionary objectForKey:@"title"]];
                       movie.idNumber = [moviesDictionary objectForKey:@"id"];
                       // "Posters" is a JSON Object within "Title"
                       movie.posters = [moviesDictionary objectForKey:@"posters"];
                       // "Thumbnail is an Object within "Posters"
                       movie.thumbnail = [movie.posters objectForKey:@"thumbnail"];
                       
                       [self.movies addObject:movie];
                       
                   }
                   //3
                   dispatch_async(dispatch_get_main_queue(), ^{
                       [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                       [self.collectionView reloadData];

                   });
               }];
    
    // 4
    [getImageTask resume];
    
//    self.movies = [NSMutableArray array];
//    
//    NSArray *moviesArray = [dataDictionary objectForKeyedSubscript:@"movies"];
//    
//    
//    for (NSDictionary *moviesDictionary in moviesArray) {
//        
//        Movie *movie = [Movie movieWithTitle:[moviesDictionary objectForKey:@"title"]];
//        movie.idNumber = [moviesDictionary objectForKey:@"id"];
//        // "Posters" is a JSON Object within "Title"
//        movie.posters = [moviesDictionary objectForKey:@"posters"];
//        // "Thumbnail is an Object within "Posters"
//        movie.thumbnail = [movie.posters objectForKey:@"thumbnail"];
//        
//        [self.movies addObject:movie];
//        
//    }

}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showReviewsSegue"]) {
        
        ReviewsViewController *RVC = segue.destinationViewController;
        
        NSIndexPath *indexPath = [self.collectionView indexPathForCell:sender];
        
        RVC.movie = self.movies[indexPath.row];

    }
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return [self.movies count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
     RMCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    
     Movie *movie = [self.movies objectAtIndex:indexPath.row];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

        dispatch_async(dispatch_get_main_queue(), ^{
            NSData *imageData = [NSData dataWithContentsOfURL:movie.detailPosterURL];
            UIImage *image = [UIImage imageWithData:imageData];
            
            cell.imageView.image = image;
            
        });
    });
    
    return cell;
}
#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/


// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    Movie *movie = [self.movies objectAtIndex:indexPath.row];
    
    return YES;
}


/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
