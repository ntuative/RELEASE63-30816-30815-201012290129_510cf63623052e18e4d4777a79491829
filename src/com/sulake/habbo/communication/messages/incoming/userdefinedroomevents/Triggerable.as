package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class Triggerable
   {
       
      
      private var var_2420:int;
      
      private var var_1736:Array;
      
      private var _id:int;
      
      private var var_2421:String;
      
      private var var_1363:Array;
      
      private var var_2422:int;
      
      public function Triggerable(param1:IMessageDataWrapper)
      {
         var _loc5_:int = 0;
         this.var_1736 = new Array();
         this.var_1363 = new Array();
         super();
         this.var_2420 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc5_ = param1.readInteger();
            this.var_1736.push(_loc5_);
            _loc3_++;
         }
         this.var_2422 = param1.readInteger();
         this._id = param1.readInteger();
         this.var_2421 = param1.readString();
         var _loc4_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            this.var_1363.push(param1.readInteger());
            _loc3_++;
         }
      }
      
      public function get furniLimit() : int
      {
         return this.var_2420;
      }
      
      public function get stuffIds() : Array
      {
         return this.var_1736;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get stringParam() : String
      {
         return this.var_2421;
      }
      
      public function get intParams() : Array
      {
         return this.var_1363;
      }
      
      public function get code() : int
      {
         return 0;
      }
      
      public function get stuffTypeId() : int
      {
         return this.var_2422;
      }
      
      public function getBoolean(param1:int) : Boolean
      {
         return this.var_1363[param1] == 1;
      }
   }
}
