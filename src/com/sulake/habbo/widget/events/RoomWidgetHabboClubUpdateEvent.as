package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_218:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_1952:int = 0;
      
      private var var_1951:int = 0;
      
      private var var_1955:int = 0;
      
      private var var_1954:Boolean = false;
      
      private var var_1953:int;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_218,param6,param7);
         this.var_1952 = param1;
         this.var_1951 = param2;
         this.var_1955 = param3;
         this.var_1954 = param4;
         this.var_1953 = param5;
      }
      
      public function get daysLeft() : int
      {
         return this.var_1952;
      }
      
      public function get periodsLeft() : int
      {
         return this.var_1951;
      }
      
      public function get pastPeriods() : int
      {
         return this.var_1955;
      }
      
      public function get allowClubDances() : Boolean
      {
         return this.var_1954;
      }
      
      public function get clubLevel() : int
      {
         return this.var_1953;
      }
   }
}
