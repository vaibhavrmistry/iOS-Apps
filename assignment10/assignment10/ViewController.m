//
//  ViewController.m
//  assignment10
//
//  Created by Vaibhav Mistry on 11/28/15.
//  Copyright © 2015 Vaibhav Mistry. All rights reserved.
//

#import "ViewController.h"
#import <SystemConfiguration/SystemConfiguration.h>
#import "IssueDetailViewController.h"
#import "Issue.h"



@interface ViewController ()
{
    NSMutableData *webData;
    NSURLConnection *connection;
    NSMutableArray *array;
    Issue * issue;
    
}


@end

@implementation ViewController
@synthesize issueListTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if (![self isDataSourceAvailable]) {
        [self displayAlertForNoConnection];
        return;
    }
    else{
        array = [[NSMutableArray alloc]init];
        [self setupConnection];
    }
    
    self.issueListTableView.rowHeight = 79.f;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)isDataSourceAvailable
{
    BOOL _isDataSourceAvailable = NO;
    
    static BOOL checkNetwork = YES;
    if (checkNetwork) { // Since checking the reachability of a host can be expensive, cache the result and perform the reachability check once.
        checkNetwork = NO;
        
        Boolean success;
        const char *host_name = "twitter.com"; // your data source host name
        
        SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithName(NULL, host_name);
        SCNetworkReachabilityFlags flags;
        success = SCNetworkReachabilityGetFlags(reachability, &flags);
        _isDataSourceAvailable = success && (flags & kSCNetworkFlagsReachable) && !(flags & kSCNetworkFlagsConnectionRequired);
        CFRelease(reachability);
    }
    return _isDataSourceAvailable;
}


-(void)displayAlertForNoConnection{
    

    NSString *msg = [NSString stringWithFormat:@"No Internet Connection. Please try again later"];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg
                                                   delegate:self
                                          cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    
    
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [webData setLength:0];
}


-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [webData appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Fail with Error");
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSMutableArray *allDataArray = [NSJSONSerialization JSONObjectWithData:webData options:0 error:nil];
    
    for (NSDictionary * dict in allDataArray) {
        Issue *localIssue = [[Issue alloc]init];
        bool openFlag = NO;
        
        NSString * title = [dict objectForKey:@"title"];
        NSString * issId = [dict objectForKey:@"id"];
        NSString * issueNumber = [dict objectForKey:@"number"];
        NSString * state = [dict objectForKey:@"state"];
        NSString * description = [dict objectForKey:@"body"];
        NSString * createdOn = [dict objectForKey:@"created_at"];
        NSString * updatedAt = [dict objectForKey:@"updated_at"];
        NSString * comments = [dict objectForKey:@"comments"];
        NSString * commentsUrl = [dict objectForKey:@"comments_url"];
        
        
        NSString * closedAt = nil;
        if ([[dict objectForKey:@"closed_at"] isKindOfClass: [NSString class]])
        {
        
            closedAt = [dict objectForKey:@"closed_at"];
        
        }
        NSDictionary *user = [dict objectForKey:@"user"];
        NSString *loggedBy = [user objectForKey:@"login"];
        NSString *assignedTo = nil;
        if ([[dict objectForKey:@"assignee"] isKindOfClass: [NSDictionary class]])
        {
        
        NSDictionary *assignee = [dict objectForKey:@"assignee"];
        
        if([assignee count] > 0)
        {
            
            assignedTo = [assignee objectForKey:@"login"];
        }
        }
        if ([state isEqualToString:@"open"]) {
            openFlag = YES;
        }
        
        [localIssue initWithTitle:title andDescription:description andId:issId andNumber:issueNumber andLoggedBy:loggedBy andAssignedTo:assignedTo andCreatedOn:createdOn andUpdatedAt:updatedAt andClosedOn:closedAt andIsOpen:openFlag andComments:comments andCommentsUrl:commentsUrl];
        
        [array addObject:localIssue];
    }
    
    
    
    
    
    [[self issueListTableView]reloadData];
}


-(void)setupConnection{
    
    NSURL *url = [NSURL URLWithString:@"https://api.github.com/repos/rails/rails/issues?state=all"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    connection = [NSURLConnection connectionWithRequest:request delegate:self];
    
    if (connection) {
        webData = [[NSMutableData alloc]init];
    }
}

//UI Table View DataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return array.count;
    
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
       issue = [array objectAtIndex:indexPath.row];
    
    
    
    
    // item = [productList objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", issue.issueNumber];
    cell.detailTextLabel.numberOfLines = 3;
   cell.detailTextLabel.text = issue.issueTitle;
   cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    UIImage *img = [[UIImage alloc]initWithData:item.itemImageData];
    
    if (issue.isOpen) {
        cell.imageView.image = [UIImage imageNamed:@"open.png"];
    }
    else
    {
        cell.imageView.image = [UIImage imageNamed:@"closed.png"];
    }
    
    
    return cell;
    
    
}

//UI Table View Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    issue = [array objectAtIndex:indexPath.row];


   [self performSegueWithIdentifier:@"issueDetailsSegue" sender:nil];
    
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"issueDetailsSegue"] )
    { IssueDetailViewController *detailVC = (IssueDetailViewController *)segue.destinationViewController;
        detailVC.issue = issue;
    }
}

@end
