//
//  ViewController1.h
//  bidmongol
//
//  Created by Delgersuren Bold on 8/23/12.
//

#import <UIKit/UIKit.h>

@interface ViewController1 : UIViewController<UITableViewDataSource,UITableViewDelegate,NSURLConnectionDataDelegate>
@property (retain, nonatomic) IBOutlet UITableView *customerList;
- (IBAction)refreshButton:(id)sender;
@end
