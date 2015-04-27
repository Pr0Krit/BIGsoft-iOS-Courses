//
//  Phone.h
//  
//
//  Created by Timur Bernikowich on 25.04.15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Contact;

@interface Phone : NSManagedObject

@property (nonatomic, retain) NSString * number;
@property (nonatomic, retain) Contact *owner;

@end
