//
//  ViewController1.h
//  bidmongol
//
//  Created by Delgersuren Bold on 8/23/12.
//

#import <UIKit/UIKit.h>
#import "ViewControllerFirstTabBarDetail.h"

@interface ViewControllerFirstTabBar : UIViewController<UITableViewDataSource,UITableViewDelegate,NSURLConnectionDataDelegate>
@property (retain, nonatomic) IBOutlet UITableView *customerList;
- (IBAction)refreshButton:(id)sender;
@end
