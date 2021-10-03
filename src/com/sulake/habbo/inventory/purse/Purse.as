package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_1568:int = 0;
      
      private var var_1569:int = 0;
      
      private var var_2001:int = 0;
      
      private var var_2003:Boolean = false;
      
      private var var_2002:Boolean = false;
      
      public function Purse()
      {
         super();
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1568 = Math.max(0,param1);
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1569 = Math.max(0,param1);
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         this.var_2001 = Math.max(0,param1);
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         this.var_2003 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2002 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1568;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1569;
      }
      
      public function get clubPastPeriods() : int
      {
         return this.var_2001;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return this.var_2003;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2002;
      }
   }
}
