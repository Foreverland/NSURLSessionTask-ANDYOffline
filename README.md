# [WIP] — NSURLSessionTask-ANDYOffline

[![CI Status](http://img.shields.io/travis/NSElvis/NSURLSessionTask-ANDYOffline.svg?style=flat)](https://travis-ci.org/NSElvis/NSURLSessionTask-ANDYOffline)

Offline support for HTTP requests (`POST`/`PUT`/`PATCH`/`DELETE`). If the request fails, timesout or if you're offline you can save the task on disk and reproduce it later.

### How it works

Saving failed requests:

```objc
[task saveWithParams:params];
```

```objc
[manager POST:path
   parameters:params
      success:^(NSURLSessionDataTask *task, id responseObject) {

          // everything went well, be happy

      } failure:^(NSURLSessionDataTask *task, NSError *error) {

          [task saveWithParams:params];

      }];
```

Retrieving offline requests:

```objc
NSArray *offlineTasks = [NSURLSessionTask offlineTasks];
```

Removing offline requests:

```objc
[task remove];
```

Replaying offline requests (needs a `NSURLSession` or a `AFHTTPSessionManager`):

```objc
[manager replay];
```

## Author

Elvis Nuñez, hello@nselvis.com

## License

**NSURLSessionTask-ANDYOffline** is available under the MIT license. See the [LICENSE](https://github.com/NSElvis/NSURLSessionTask-ANDYOffline/blob/master/LICENSE.md) file for more info.
