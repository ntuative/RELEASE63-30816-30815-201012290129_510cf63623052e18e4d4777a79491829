package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_2151:int;
      
      private var var_1408:String;
      
      private var var_2155:int;
      
      private var var_2153:int;
      
      private var _category:int;
      
      private var var_1906:String;
      
      private var var_1268:int;
      
      private var var_2156:int;
      
      private var var_2152:int;
      
      private var var_2158:int;
      
      private var var_2154:int;
      
      private var var_2157:Boolean;
      
      private var var_2709:int;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         this.var_2151 = param1;
         this.var_1408 = param2;
         this.var_2155 = param3;
         this.var_2153 = param4;
         this._category = param5;
         this.var_1906 = param6;
         this.var_1268 = param7;
         this.var_2156 = param8;
         this.var_2152 = param9;
         this.var_2158 = param10;
         this.var_2154 = param11;
         this.var_2157 = param12;
      }
      
      public function get itemID() : int
      {
         return this.var_2151;
      }
      
      public function get itemType() : String
      {
         return this.var_1408;
      }
      
      public function get roomItemID() : int
      {
         return this.var_2155;
      }
      
      public function get itemTypeID() : int
      {
         return this.var_2153;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_1906;
      }
      
      public function get extra() : int
      {
         return this.var_1268;
      }
      
      public function get timeToExpiration() : int
      {
         return this.var_2156;
      }
      
      public function get creationDay() : int
      {
         return this.var_2152;
      }
      
      public function get creationMonth() : int
      {
         return this.var_2158;
      }
      
      public function get creationYear() : int
      {
         return this.var_2154;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2157;
      }
      
      public function get songID() : int
      {
         return this.var_1268;
      }
   }
}
