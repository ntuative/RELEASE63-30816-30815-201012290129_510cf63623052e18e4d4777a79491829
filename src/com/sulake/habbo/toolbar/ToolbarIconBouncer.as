package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2596:Number;
      
      private var var_1533:Number;
      
      private var var_921:Number;
      
      private var var_922:Number = 0;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         this.var_2596 = param1;
         this.var_1533 = param2;
      }
      
      public function reset(param1:int) : void
      {
         this.var_921 = param1;
         this.var_922 = 0;
      }
      
      public function update() : void
      {
         this.var_921 += this.var_1533;
         this.var_922 += this.var_921;
         if(this.var_922 > 0)
         {
            this.var_922 = 0;
            this.var_921 = this.var_2596 * -1 * this.var_921;
         }
      }
      
      public function get location() : Number
      {
         return this.var_922;
      }
   }
}
