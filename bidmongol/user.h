//
//  user.h
//  bidmongol
//
//  Created by Delgersuren Bold on 8/26/12.
//
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface user : NSObject {
    
	NSInteger userID;
	NSString *userName;
	NSInteger *userPhone;
	
}

@property (nonatomic, readonly) NSInteger userID;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, assign) NSInteger *userPhone;

@end

