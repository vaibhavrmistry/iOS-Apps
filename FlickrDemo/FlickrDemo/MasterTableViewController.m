//
//  MasterTableViewController.m
//  FlickrDemo
//
//  Created by Vaibhav Mistry on 7/19/14.
//  Copyright (c) 2014 Vaibhav. All rights reserved.
//

#import "MasterTableViewController.h"
#import "FlickrFetcher.h"
#import "ViewController.h"
#import "Photo.h"

@interface MasterTableViewController ()<FlickrFetcherProtocol>
@property (nonatomic,strong) NSArray *photos;
@property (nonatomic,strong) FlickrFetcher *flickrFetcher;
@property (nonatomic,strong) Photo *photoData;

@end

@implementation MasterTableViewController
@synthesize photos=_photos;
@synthesize flickrFetcher=_flickrFetcher;
@synthesize photoData=_photoData;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.flickrFetcher=[[FlickrFetcher alloc]init];
    self.flickrFetcher.delegate=self;
    
    self.photos=[self.flickrFetcher fetchPhotos ];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.photos count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    if(!cell)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
        
    }
    
    cell.textLabel.text=[[self.photos objectAtIndex:indexPath.row] valueForKey:@"title"];
    
    // Configure the cell...
    
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSURL *photoURL= [[NSURL URLWithString:[[self.photos objectAtIndex:indexPath.row] valueForKey:@"url_m"]]];
    
    
NSString *photoURL=[[self.photos objectAtIndex:indexPath.row]valueForKey:@"url_l"];
    
    [self.flickrFetcher fetchPhotoFromDatabase:photoURL];

    //UIImage *downloadedImage=[self.flickrFetcher downloadPhotoWithURL:[NSURL URLWithString:photoURL]];
    
    ViewController *vc= [[self.splitViewController viewControllers] lastObject];
//    
    [vc.indicatorView startAnimating];
}

-(void)setImageToImageView:(UIImage *)image
{
    
    ViewController *vc= [[self.splitViewController viewControllers] lastObject];
    [vc.indicatorView stopAnimating];
    vc.image=image;
    
}




/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
