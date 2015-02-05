# Sample App Backend

This project serves as a very slim backend designed to work with Klarna on Demand's sample applications (both [iOS](https://github.com/klarna/klarna-on-demand-ios) and [Android](https://github.com/klarna/klarna-on-demand-android)) in order to demonstrate proper use of Klarna's on Demand SDK. This server receives purchase requests issued by the sample applications, and forwards these requests to Klarna.

The server itself is implemented in [Ruby](https://www.ruby-lang.org/en/) using [Sinatra](http://www.sinatrarb.com/). Even if you are not familiar with the language do not worry, as the code has been extensively documented. The file that contains the entirety of the server is [backend.rb](./backend.rb).

The server logs all API requests it performs to the terminal, so you can see what's going on even without diving into the code.

## Integration with the Klarna on Demand API
This sample backend interacts directly with Klarna's on Demand API, specifically for the purpose of authorizing and capturing orders. You can read more about the API [here](http://docs.inapp.apiary.io/).

## Running the server
If you wish to run the server, the first step is [installing Ruby](https://www.ruby-lang.org/en/documentation/installation/).

Once that's out of the way, open a terminal and run the following command:

```
gem install bundler
```

which will install [Bundler](http://bundler.io/), a dependency manager that will allow installing the project's dependencies. Still in the terminal, navigate to the project's directory and run:

```
bundle install
```

to install said dependencies.

The server is now ready to run. Simply point a terminal to the project's folder and run:

```
rackup
```

which should result in output such as:

```
[2015-01-07T13:04:14.4616 #37268]  INFO -- : Incoming/outgoing API requests will be logged to the console.
[2015-01-07 13:04:14] INFO  WEBrick 1.3.1
[2015-01-07 13:04:14] INFO  ruby 2.1.2 (2014-05-08) [x86_64-darwin13.0]
[2015-01-07 13:04:14] INFO  WEBrick::HTTPServer#start: pid=37268 port=9292
```

indicating the server is now listening at port 9292.

### Using your credentials
The server's code includes placeholder credentials that are set up to work with those supplied as an example in the SDK's documentation. You can use your own credentials by running the following command in the terminal:

```
rake set_credentials
```

Where upon you will be asked to supply your credentials. This will alter the [credentials.rb](./credentials.rb) file so that all future runs of the server make use of the credentials you supplied.

## License
The sample backend is available under the Apache 2.0 license. See the [LICENSE](./LICENSE) file for more info.