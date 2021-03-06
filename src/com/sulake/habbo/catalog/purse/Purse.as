package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
      
      public static const const_495:int = 0;
       
      
      private var var_2022:int = 0;
      
      private var var_1270:Dictionary;
      
      private var var_1568:int = 0;
      
      private var var_1569:int = 0;
      
      private var var_2002:Boolean = false;
      
      private var var_2176:int = 0;
      
      private var var_2175:int = 0;
      
      public function Purse()
      {
         this.var_1270 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return this.var_2022;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_2022 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1568;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1568 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1569;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1569 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_1568 > 0 || this.var_1569 > 0;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2002;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2002 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2176;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_2176 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2175;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_2175 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1270;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1270 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1270[param1];
      }
   }
}
