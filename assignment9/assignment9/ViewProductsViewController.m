//
//  ViewProductsViewController.m
//  assignment9
//
//  Created by Vaibhav Mistry on 11/18/15.
//  Copyright © 2015 Vaibhav Mistry. All rights reserved.
//

#import "ViewProductsViewController.h"
#import "ItemCD+ItemCDUtil.h"
#import "StoreCD+StoreCDUtil.h"
#import "ProductDetailsViewController.h"

@interface ViewProductsViewController ()
@property (strong,nonatomic) ItemCD * item;
@end

@implementation ViewProductsViewController
@synthesize productListTableView, productList,item,mySearchBar,fileredProdList,isFiltered,tapGestureRecognizer;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationItem setHidesBackButton:NO animated:YES];
    
    //get store object from database
    StoreCD *store = [StoreCD getStoreFromDatabase];
    
    
    //Initiate the prodList
    
    
    productList = [ItemCD fetchAllItems];
//    
//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonClicked)];
//    
//    [[self navigationItem] setRightBarButtonItem:addButton];
    
    //Reload the table view;
    [productListTableView reloadData];
    
    //Dismiss keyboard by pressing anywhere
    tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleSingleTap:)];
    tapGestureRecognizer.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGestureRecognizer];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handleSingleTap:(UITapGestureRecognizer *) sender
{
    [self.view endEditing:YES];
}

-(void)viewWillAppear:(BOOL)animated
{   //get store object from database
    
    productList = [ItemCD fetchAllItems];
    
    //Reload the table view;
    [productListTableView reloadData];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


//UI Table View DataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if(isFiltered == YES)
    {
        return fileredProdList.count;
    }
    else
    {
        return productList.count;
    }
    
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    if(isFiltered == YES)
    {
        item = [fileredProdList objectAtIndex:indexPath.row];
    }
    else
    {
        item = [productList objectAtIndex:indexPath.row];
    }
    
    
    
    // item = [productList objectAtIndex:indexPath.row];
    cell.textLabel.text = item.itemName;
    cell.detailTextLabel.text = item.itemDescription;
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    UIImage *img = [[UIImage alloc]initWithData:item.itemImageData];
    cell.imageView.image = img;
    
    return cell;
    
    
}

//UI Table View Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    item = [productList objectAtIndex:indexPath.row];
    
//   ProductDetailsViewController *prodDetailsVC = [[ProductDetailsViewController alloc]initWithItem:[productList objectAtIndex:indexPath.row]];
   
//    [self.navigationController pushViewController:prodDetailsVC animated:YES];
    
    [self performSegueWithIdentifier:@"prodDetailsSegue" sender:nil];
    
    
}


////Add button clicked code
//-(void)addButtonClicked{
//    
////    AddProductViewController *addProdVC = [[AddProductViewController alloc]initWithNibName:@"AddProductViewController" bundle:nil];
////    
////    [self.navigationController pushViewController:addProdVC animated:YES];
//    
//    
//}

-(void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [productListTableView setEditing:editing animated:animated];
}


- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    
    //Convert NSString to NSNumber
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *myNumber = [f numberFromString:searchText];
    
    if(searchText.length == 0)
    {
        //Set our boolean flag
        isFiltered = NO;
        
    }
    else
    {
        
        
        //Set our boolean flag
        isFiltered = YES;
        
    }
    
    if ([[NSScanner scannerWithString:searchText] scanInt:NULL])
    {
        //Alloc and init our fileredData
        fileredProdList = [[NSMutableArray alloc]init];
        
        for (ItemCD * tempItem in productList  ) {
            
            if ([myNumber integerValue] == [tempItem.itemId integerValue]) {
                [fileredProdList addObject:tempItem];
            }
            
            
        }
        
        //Reload the table view;
        [productListTableView reloadData];
    }
    else{
        //display an alert screen if non numeric data entered
        NSString *msg = [NSString stringWithFormat:@"Please enter numeric data "];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [productListTableView reloadData];
        
    }
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"prodDetailsSegue"] )
    {ProductDetailsViewController *detailVC = (ProductDetailsViewController *)segue.destinationViewController;
    detailVC.item = item;
    }
}



- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [mySearchBar resignFirstResponder];
}



@end
