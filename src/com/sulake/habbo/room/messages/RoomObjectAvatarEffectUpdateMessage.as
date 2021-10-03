package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarEffectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_155:int;
      
      private var var_1941:int;
      
      public function RoomObjectAvatarEffectUpdateMessage(param1:int = 0, param2:int = 0)
      {
         super();
         this.var_155 = param1;
         this.var_1941 = param2;
      }
      
      public function get effect() : int
      {
         return this.var_155;
      }
      
      public function get delayMilliSeconds() : int
      {
         return this.var_1941;
      }
   }
}
