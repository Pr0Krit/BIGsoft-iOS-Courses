//
//  DetailViewController.h
//  Lesson7
//
//  Created by Timur Bernikowich on 25.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

