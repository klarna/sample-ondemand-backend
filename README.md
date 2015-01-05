# Sample App Backend

This project serves as a very slim backend designed to work with Klarna on Demand's sample applications (both [iOS](https://github.com/klarna/klarna-on-demand-ios) and [Android](https://github.com/klarna/klarna-on-demand-android)) in order to demonstrate proper use of the SDK. This server receives purchase requests issued by the sample applications, and forwards these requests to Klarna.

The server itself is implemented in [Ruby](https://www.ruby-lang.org/en/) using [Sinatra](http://www.sinatrarb.com/). Even if you are not familiar with the language, the code has been extensively documented and should prove manageable.

## License

The sample backend is available under the Apache 2.0 license. See the [LICENSE](./LICENSE) file for more info.