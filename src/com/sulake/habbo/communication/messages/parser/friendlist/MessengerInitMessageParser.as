package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendCategoryData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   
   public class MessengerInitMessageParser implements IMessageParser
   {
       
      
      private var var_2356:int;
      
      private var var_2355:int;
      
      private var var_2353:int;
      
      private var var_2352:int;
      
      private var var_2351:int;
      
      private var var_2354:int;
      
      private var var_93:Array;
      
      private var var_213:Array;
      
      public function MessengerInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_93 = new Array();
         this.var_213 = new Array();
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         this.var_2356 = param1.readInteger();
         this.var_2355 = param1.readInteger();
         this.var_2353 = param1.readInteger();
         this.var_2352 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            this.var_93.push(new FriendCategoryData(param1));
            _loc4_++;
         }
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_213.push(new FriendData(param1));
            _loc4_++;
         }
         this.var_2351 = param1.readInteger();
         this.var_2354 = param1.readInteger();
         return true;
      }
      
      public function get userFriendLimit() : int
      {
         return this.var_2356;
      }
      
      public function get normalFriendLimit() : int
      {
         return this.var_2355;
      }
      
      public function get extendedFriendLimit() : int
      {
         return this.var_2353;
      }
      
      public function get friendRequestLimit() : int
      {
         return this.var_2351;
      }
      
      public function get friendRequestCount() : int
      {
         return this.var_2354;
      }
      
      public function get categories() : Array
      {
         return this.var_93;
      }
      
      public function get friends() : Array
      {
         return this.var_213;
      }
      
      public function get evenMoreExtendedFriendLimit() : int
      {
         return this.var_2352;
      }
   }
}
