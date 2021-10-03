package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var var_1125:Boolean;
      
      private var var_2027:int;
      
      private var var_2029:String;
      
      private var var_315:int;
      
      private var var_2026:int;
      
      private var var_1924:String;
      
      private var var_2030:String;
      
      private var var_2028:String;
      
      private var var_773:Array;
      
      private var _disposed:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         this.var_773 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1125 = false;
            return;
         }
         this.var_1125 = true;
         this.var_2027 = int(_loc2_);
         this.var_2029 = param1.readString();
         this.var_315 = int(param1.readString());
         this.var_2026 = param1.readInteger();
         this.var_1924 = param1.readString();
         this.var_2030 = param1.readString();
         this.var_2028 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            this.var_773.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_773 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get ownerAvatarId() : int
      {
         return this.var_2027;
      }
      
      public function get ownerAvatarName() : String
      {
         return this.var_2029;
      }
      
      public function get flatId() : int
      {
         return this.var_315;
      }
      
      public function get eventType() : int
      {
         return this.var_2026;
      }
      
      public function get eventName() : String
      {
         return this.var_1924;
      }
      
      public function get eventDescription() : String
      {
         return this.var_2030;
      }
      
      public function get creationTime() : String
      {
         return this.var_2028;
      }
      
      public function get tags() : Array
      {
         return this.var_773;
      }
      
      public function get exists() : Boolean
      {
         return this.var_1125;
      }
   }
}
