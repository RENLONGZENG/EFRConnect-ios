//
//  SILBluetoothFieldModel.m
//  SiliconLabsApp
//
//  Created by Eric Peterson on 10/20/15.
//  Copyright © 2015 SiliconLabs. All rights reserved.
//

#import "SILBluetoothFieldModel.h"

@implementation SILBluetoothFieldModel

- (instancetype)initWithName:(NSString *)name unit:(NSString *)unit format:(NSString *)format requires:(NSString *)requirement {
    self = [super init];
    if (self) {
        self.name = name;
        self.unit = unit;
        self.format = format;
        self.requirement = requirement;
    }
    return self;
}

@end
