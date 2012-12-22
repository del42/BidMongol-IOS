//
//  ViewControllerForMongoliaTabBar.h
//  bidmongol
//
//  Created by Delgersuren Bold on 12/20/12.
//
//

#import <UIKit/UIKit.h>
#import "ViewControllerForMongoliaTabBarDetail.h"

@interface ViewControllerForMongoliaTabBar : UIViewController<UITableViewDataSource,UITableViewDelegate,NSURLConnectionDataDelegate>
@property (retain, nonatomic) IBOutlet UITableView *customerList;
- (IBAction)refreshButton:(id)sender;
@end