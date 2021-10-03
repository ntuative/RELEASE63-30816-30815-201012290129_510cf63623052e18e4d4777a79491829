package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarPostureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1961:String;
      
      private var var_1256:String;
      
      public function RoomObjectAvatarPostureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         this.var_1961 = param1;
         this.var_1256 = param2;
      }
      
      public function get postureType() : String
      {
         return this.var_1961;
      }
      
      public function get parameter() : String
      {
         return this.var_1256;
      }
   }
}
