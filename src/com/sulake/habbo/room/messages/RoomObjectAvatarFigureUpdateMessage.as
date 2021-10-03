package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_561:String;
      
      private var var_2395:String;
      
      private var var_849:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         this.var_561 = param1;
         this.var_849 = param2;
         this.var_2395 = param3;
      }
      
      public function get figure() : String
      {
         return this.var_561;
      }
      
      public function get race() : String
      {
         return this.var_2395;
      }
      
      public function get gender() : String
      {
         return this.var_849;
      }
   }
}
