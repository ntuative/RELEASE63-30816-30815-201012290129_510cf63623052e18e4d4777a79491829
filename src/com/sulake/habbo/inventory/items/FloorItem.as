package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var _id:int;
      
      protected var _ref:int;
      
      protected var _category:int;
      
      protected var _type:int;
      
      protected var var_1906:String;
      
      protected var var_1268:Number;
      
      protected var var_2640:Boolean;
      
      protected var var_2641:Boolean;
      
      protected var var_2157:Boolean;
      
      protected var var_2642:Boolean;
      
      protected var var_2639:int;
      
      protected var var_2152:int;
      
      protected var var_2158:int;
      
      protected var var_2154:int;
      
      protected var var_1618:String;
      
      protected var var_2171:int;
      
      protected var var_791:Boolean;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number, param11:int, param12:int, param13:int, param14:int, param15:String, param16:int)
      {
         super();
         this._id = param1;
         this._type = param2;
         this._ref = param3;
         this._category = param4;
         this.var_2157 = param5;
         this.var_2641 = param6;
         this.var_2640 = param7;
         this.var_2642 = param8;
         this.var_1906 = param9;
         this.var_1268 = param10;
         this.var_2639 = param11;
         this.var_2152 = param12;
         this.var_2158 = param13;
         this.var_2154 = param14;
         this.var_1618 = param15;
         this.var_2171 = param16;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get ref() : int
      {
         return this._ref;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get stuffData() : String
      {
         return this.var_1906;
      }
      
      public function get extra() : Number
      {
         return this.var_1268;
      }
      
      public function get recyclable() : Boolean
      {
         return this.var_2640;
      }
      
      public function get tradeable() : Boolean
      {
         return this.var_2641;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2157;
      }
      
      public function get sellable() : Boolean
      {
         return this.var_2642;
      }
      
      public function get expires() : int
      {
         return this.var_2639;
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
      
      public function get slotId() : String
      {
         return this.var_1618;
      }
      
      public function get songId() : int
      {
         return this.var_2171;
      }
      
      public function set locked(param1:Boolean) : void
      {
         this.var_791 = param1;
      }
      
      public function get locked() : Boolean
      {
         return this.var_791;
      }
   }
}
