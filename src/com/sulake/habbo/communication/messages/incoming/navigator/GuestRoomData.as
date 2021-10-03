package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_315:int;
      
      private var var_746:Boolean;
      
      private var var_909:String;
      
      private var _ownerName:String;
      
      private var var_2064:int;
      
      private var var_2061:int;
      
      private var var_2062:int;
      
      private var var_1514:String;
      
      private var var_2060:int;
      
      private var var_2063:Boolean;
      
      private var var_682:int;
      
      private var var_1345:int;
      
      private var var_2066:String;
      
      private var var_773:Array;
      
      private var var_2067:RoomThumbnailData;
      
      private var var_2065:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_773 = new Array();
         super();
         this.var_315 = param1.readInteger();
         this.var_746 = param1.readBoolean();
         this.var_909 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2064 = param1.readInteger();
         this.var_2061 = param1.readInteger();
         this.var_2062 = param1.readInteger();
         this.var_1514 = param1.readString();
         this.var_2060 = param1.readInteger();
         this.var_2063 = param1.readBoolean();
         this.var_682 = param1.readInteger();
         this.var_1345 = param1.readInteger();
         this.var_2066 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_773.push(_loc4_);
            _loc3_++;
         }
         this.var_2067 = new RoomThumbnailData(param1);
         this.var_2065 = param1.readBoolean();
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
      
      public function get flatId() : int
      {
         return this.var_315;
      }
      
      public function get event() : Boolean
      {
         return this.var_746;
      }
      
      public function get roomName() : String
      {
         return this.var_909;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_2064;
      }
      
      public function get userCount() : int
      {
         return this.var_2061;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2062;
      }
      
      public function get description() : String
      {
         return this.var_1514;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2060;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2063;
      }
      
      public function get score() : int
      {
         return this.var_682;
      }
      
      public function get categoryId() : int
      {
         return this.var_1345;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2066;
      }
      
      public function get tags() : Array
      {
         return this.var_773;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2067;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2065;
      }
   }
}
