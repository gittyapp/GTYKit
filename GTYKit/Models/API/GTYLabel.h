//
//  GTYLabel.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYObject.h"

@interface GTYLabel : GTYObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *backgroundColor;
@property (nonatomic, strong) NSString *textColor;

+ (GTYLabel *)emptyLabel;

@end
