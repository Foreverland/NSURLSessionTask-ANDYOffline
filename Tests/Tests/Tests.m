@import XCTest;

#import "AFHTTPSessionManager.h"
#import "AFHTTPSessionManager+AFOfflineRequest.h"
#import "AFURLResponseSerialization.h"

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)testPOST
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"Networking expectations"];

    NSURL *url = [NSURL URLWithString:@"http://requestb.in"];
    NSString *path = @"/1ktjuv71";

    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:url];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];

    [manager POST:path
       parameters:@{@"hellooo" : @"heheheh"}
          success:^(NSURLSessionDataTask *task, id JSON) {
              NSString *JSONString = [[NSString alloc] initWithData:JSON encoding:NSUTF8StringEncoding];

              NSLog(@"response: %@", JSONString);
              XCTAssertNotNil(JSON);
              [expectation fulfill];

          } failure:^(NSURLSessionDataTask *task, NSError *error) {
              NSLog(@"failure: %@", error);
              XCTAssertNotNil(error);
              [expectation fulfill];
          }];

    [self waitForExpectationsWithTimeout:60.0f handler:nil];
}

@end
