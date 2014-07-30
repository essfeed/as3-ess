package com.hypecal.ess
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	
	public final class EssReader
	{
		private var myESS:XML 		= null;
		private var DEBUG:Boolean 	= true;
		private var currentFeed:int	= 0;
		
		public function EssReader() {}
		
		public function load( url:String=null ):void
		{
			var urlLoader:URLLoader = new URLLoader();
			
			if ( url != null )
			{
				urlLoader.load( new URLRequest( url ) );
				urlLoader.addEventListener( Event.COMPLETE,			this.onXMLFileLoaded );
				urlLoader.addEventListener( IOErrorEvent.IO_ERROR,	this.onIOError );
			}
			
			return urlLoader;
		}
		
		
		/**
		 * Called when the XML data has been loaded.
		 */
		private function onXMLFileLoaded( e:Event ):void
		{
			myESS = new XML( e.target.data );
			
			controlESSFeed();
		}
		
		
		private function controlESSFeed():void
		{
			// TODO: Control structure and content of the Feed.
		}
		
		
		public function getChannel():int
		{
			return myESS.channel;
		}
		
		
		public function getNumFeed():int
		{
			return myESS.channel.feed.length();
		}
		
		
		public function getFeed( _currentFeed:int ):void
		{
			currentFeed = _currentFeed;
			
			return myESS.channel.feed[ currentFeed ];
		}
		
		
		
		private function getTags():XMLList
		{
			var tagList:XMLList = myESS.channel.feed[ currentFeed ].tags;
			
			return tagList;
		}
		
		
		
		
		
		private function onIOError( e:IOErrorEvent ):void
		{
			this.handleError( e.toString() );
		}
		
		private function handleError( txt:String ):void
		{
			if ( this.DEBUG == true )
			{
				trace( txt );
			}
		}
	}
}