//
//  GTYDownloadEvent.h
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "GTYEvent.h"

@class GTYDownload;

@interface GTYDownloadEvent : GTYEvent

@property (nonatomic, strong) GTYDownload *download;

@end
