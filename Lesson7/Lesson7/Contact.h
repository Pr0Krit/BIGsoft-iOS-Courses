//
//  Contact.h
//  
//
//  Created by Timur Bernikowich on 25.04.15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Phone;

@interface Contact : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSSet *phones;
@end

@interface Contact (CoreDataGeneratedAccessors)

- (void)addPhonesObject:(Phone *)value;
- (void)removePhonesObject:(Phone *)value;
- (void)addPhones:(NSSet *)values;
- (void)removePhones:(NSSet *)values;

@end
