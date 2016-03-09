//
//  ViewProductsViewController.h
//  assignment9
//
//  Created by Vaibhav Mistry on 11/18/15.
//  Copyright © 2015 Vaibhav Mistry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewProductsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>
@property (strong, nonatomic) IBOutlet UITableView *productListTableView;
@property (strong, nonatomic) NSMutableArray *productList;
@property (strong, nonatomic) IBOutlet UISearchBar *mySearchBar;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGestureRecognizer;
@property (strong, nonatomic) NSMutableArray *fileredProdList;
@property BOOL isFiltered;


@end
