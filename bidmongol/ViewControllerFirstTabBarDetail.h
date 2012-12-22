//
//  ViewController4.h
//  bidmongol
//
//  Created by Delgersuren Bold on 12/18/12.
//
//

#import <UIKit/UIKit.h>

@interface ViewControllerFirstTabBarDetail : UIViewController

@property (nonatomic, strong) NSString *cellName;
@property (retain, nonatomic) IBOutlet UILabel *customerID;
@property (retain, nonatomic) IBOutlet UILabel *customerName;
@property (retain, nonatomic) IBOutlet UILabel *customerPhone;
@property (retain, nonatomic) IBOutlet UILabel *customerEmail;
@property (retain, nonatomic) IBOutlet UILabel *customerAddress;
@end
