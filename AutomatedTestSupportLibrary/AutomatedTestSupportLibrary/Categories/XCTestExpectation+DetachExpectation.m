/* Copyright (c) 2017 - 2020 BlackBerry Limited.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*
*/

#import "XCTestExpectation+DetachExpectation.h"
#import <objc/runtime.h>

@implementation XCTestExpectation (DetachExpectation)

- (BOOL)isDetached {
    NSNumber *isDetached = objc_getAssociatedObject(self, @selector(isDetached));
    if (!isDetached) {
        isDetached = [NSNumber numberWithBool:NO];
    }
    return [isDetached boolValue];
}

- (void)setDetached:(BOOL)isDetached {
    objc_setAssociatedObject(self, @selector(isDetached), [NSNumber numberWithBool:isDetached], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
