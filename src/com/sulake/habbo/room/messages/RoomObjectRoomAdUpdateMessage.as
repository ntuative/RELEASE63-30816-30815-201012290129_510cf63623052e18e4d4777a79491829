package com.sulake.habbo.room.messages
{
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   
   public class RoomObjectRoomAdUpdateMessage extends RoomObjectUpdateMessage
   {
      
      public static const const_940:String = "RORUM_ROOM_AD_ACTIVATE";
       
      
      private var _type:String;
      
      private var var_403:String;
      
      private var var_1180:String;
      
      public function RoomObjectRoomAdUpdateMessage(param1:String, param2:String, param3:String)
      {
         super(null,null);
         this._type = param1;
         this.var_403 = param2;
         this.var_1180 = param3;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get asset() : String
      {
         return this.var_403;
      }
      
      public function get clickUrl() : String
      {
         return this.var_1180;
      }
   }
}
