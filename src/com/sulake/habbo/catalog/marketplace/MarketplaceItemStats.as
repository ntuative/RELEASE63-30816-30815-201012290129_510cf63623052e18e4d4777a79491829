package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_1967:int;
      
      private var var_1964:int;
      
      private var var_1968:int;
      
      private var _dayOffsets:Array;
      
      private var var_1465:Array;
      
      private var var_1464:Array;
      
      private var var_1966:int;
      
      private var var_1965:int;
      
      public function MarketplaceItemStats()
      {
         super();
      }
      
      public function get averagePrice() : int
      {
         return this.var_1967;
      }
      
      public function get offerCount() : int
      {
         return this.var_1964;
      }
      
      public function get historyLength() : int
      {
         return this.var_1968;
      }
      
      public function get dayOffsets() : Array
      {
         return this._dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return this.var_1465;
      }
      
      public function get soldAmounts() : Array
      {
         return this.var_1464;
      }
      
      public function get furniTypeId() : int
      {
         return this.var_1966;
      }
      
      public function get furniCategoryId() : int
      {
         return this.var_1965;
      }
      
      public function set averagePrice(param1:int) : void
      {
         this.var_1967 = param1;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_1964 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         this.var_1968 = param1;
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         this._dayOffsets = param1.slice();
      }
      
      public function set averagePrices(param1:Array) : void
      {
         this.var_1465 = param1.slice();
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         this.var_1464 = param1.slice();
      }
      
      public function set furniTypeId(param1:int) : void
      {
         this.var_1966 = param1;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         this.var_1965 = param1;
      }
   }
}
