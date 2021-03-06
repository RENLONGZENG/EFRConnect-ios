//
//  SILAttributeTableModel.m
//  SiliconLabsApp
//
//  Created by Eric Peterson on 10/6/15.
//  Copyright © 2015 SiliconLabs. All rights reserved.
//

#import <CoreBluetooth/CoreBluetooth.h>
#import "SILDescriptorTableModel.h"
#import "SILBluetoothBrowser+Constants.h"

@implementation SILDescriptorTableModel

@synthesize isExpanded;
@synthesize hideTopSeparator;

- (instancetype)initWithDescriptor:(CBDescriptor *)descriptor {
    self = [super init];
    if (self) {
        self.descriptor = descriptor;
        self.isExpanded = NO;
    }
    return self;
}

#pragma mark - SILGenericAttributeTableModel

- (BOOL)canExpand {
    return NO;
}

- (void)toggleExpansionIfAllowed {
    //can't expand
}

- (NSString *)hexUuidString {
    return [self.descriptor getHexUuidValue];
}

- (NSString*)uuidString {
    return self.descriptor.UUID.UUIDString;
}

- (NSString *)name {
    return EmptyText;
}


@end
