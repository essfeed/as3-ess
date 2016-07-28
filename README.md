AS3-ESS
=======

EssReader is an AS3 Class to read ESS Feed to present the results in a Flash/Flex Application.


## Usage

	import com.robby.ess;
	
	package 
	{
		public final class Main
		{
			private var ess:EssReader;
			
			public function Main() 
			{
				ess = new EssReader();
				var urlLoader:URLLoader = ess.load( "http://eventstandardsyndication.org/feeds/sample.ess" );
				urlLoader.addEventListener( Event.COMPLETE,	this.onESSLoaded );
			}
			
			private function onESSLoaded( e:Event ):void
			{
				var number_of_feeds:int = ess.getNumFeed();
				var channel = ess.getChannel();
				
				// -- You can use the channel's elements;
				trace( "ess.channel.title: " + channel.title );
				trace( "ess.channel.title: " + channel.uri );
				trace( "ess.channel.title: " + channel.title );
				
				
				var feed:Object;
				var tagList		:XMLList;
				var categoryList:XMLList;
				var placeList	:XMLList;
				var dateList	:XMLList;
				var priceList	:XMLList;
				var peopleList	:XMLList;
				var relationList:XMLList;
				var authorList	:XMLList;
				
				for ( var i:int=0 ; i<number_of_feeds ; i++ )
				{
					var y;
					feed = ess.getFeed( i );
					
					// -- You can use the feed's elements;
					trace( "ess.channel.feed["+i+"].title: " + feed.title );
					
					
					// -- TAGS
					tagList = feed.tags;
					for ( y=o ; y<tagList.length() ; y++ )
					{
						trace( "ess.channel.feed["+i+"].tags["+y+"]: " + tagList[y] );
					}
					
					// -- CATEGORIES
					categoryList = feed.categories;
					for ( y=o ; y<tagList.length() ; y++ )
					{
						trace( "ess.channel.feed["+i+"].categories["+y+"].name: " + categoryList[y].name );
					}
					
					
					
				}
			}
		}
	}






# Contributing

Contributions to the project are welcome. Feel free to fork and improve. I accept pull requests and issues,
especially when tests are included.

# License

(The MIT License)

Copyright (c) 2013

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.