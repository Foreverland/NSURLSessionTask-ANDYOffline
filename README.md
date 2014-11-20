# NSURLSessionTask-ANDYOffline

[![CI Status](http://img.shields.io/travis/NSElvis/NSURLSessionTask-ANDYOffline.svg?style=flat)](https://travis-ci.org/NSElvis/NSURLSessionTask-ANDYOffline)

Offline support for HTTP requests (`POST`/`PUT`/`PATCH`/`DELETE`). If the request fails, timesout or if you're offline you can save the task on disk and reproduce it later.

### How it works

Saving failed requests:

```objc
[manager POST:path
   parameters:params
      success:^(NSURLSessionDataTask *task, id responseObject) {

          // everything went well, be happy

      } failure:^(NSURLSessionDataTask *task, NSError *error) {

          [task saveWithParams:params];

      }];
```

Retreiving offline requests:

```objc
NSArray *offlineTasks = [NSURLSessionTask offlineTasks]
```

### Missing

- [ ] Test `isEqual` between a `PUT` and a `POST` request
- [ ] Test `isEqual` between a `PUT` and a `PUT` request
- [ ] Support `DELETE` requests
- [ ] Support removing offline requests
- [ ] Support secure/encrypted storing
- [ ] Support multipart requests
- [ ] Support posting/replaying offline requests
- [ ] Support diffing/mapping requests (if a request was created, updated and deleted it shouldn't do anything)
- [ ] Provide a block to update things when an offline request succeeds

## Author

Elvis Nuñez, hello@nselvis.com

## License

**NSURLSessionTask-ANDYOffline** is available under the MIT license. See the LICENSE file for more info.
