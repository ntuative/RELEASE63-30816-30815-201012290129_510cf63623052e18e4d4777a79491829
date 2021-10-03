package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_2381:String;
      
      private var var_2436:Array;
      
      private var var_2437:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         this.var_2381 = param1;
         this.var_2436 = param2;
         this.var_2437 = param3;
      }
      
      public function get menuId() : String
      {
         return this.var_2381;
      }
      
      public function get yieldList() : Array
      {
         return this.var_2436;
      }
      
      public function get lockToIcon() : Boolean
      {
         return this.var_2437;
      }
   }
}
