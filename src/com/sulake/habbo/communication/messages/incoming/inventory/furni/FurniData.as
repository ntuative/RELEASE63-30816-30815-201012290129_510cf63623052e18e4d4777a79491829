package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_2293:int;
      
      private var var_1408:String;
      
      private var _objId:int;
      
      private var var_1839:int;
      
      private var _category:int;
      
      private var var_1906:String;
      
      private var var_2295:Boolean;
      
      private var var_2294:Boolean;
      
      private var var_2296:Boolean;
      
      private var var_2298:Boolean;
      
      private var var_2297:int;
      
      private var var_1268:int;
      
      private var var_1618:String = "";
      
      private var var_2171:int = -1;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         this.var_2293 = param1;
         this.var_1408 = param2;
         this._objId = param3;
         this.var_1839 = param4;
         this._category = param5;
         this.var_1906 = param6;
         this.var_2295 = param7;
         this.var_2294 = param8;
         this.var_2296 = param9;
         this.var_2298 = param10;
         this.var_2297 = param11;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         this.var_1618 = param1;
         this.var_1268 = param2;
      }
      
      public function get stripId() : int
      {
         return this.var_2293;
      }
      
      public function get itemType() : String
      {
         return this.var_1408;
      }
      
      public function get objId() : int
      {
         return this._objId;
      }
      
      public function get classId() : int
      {
         return this.var_1839;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_1906;
      }
      
      public function get isGroupable() : Boolean
      {
         return this.var_2295;
      }
      
      public function get isRecyclable() : Boolean
      {
         return this.var_2294;
      }
      
      public function get isTradeable() : Boolean
      {
         return this.var_2296;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2298;
      }
      
      public function get expiryTime() : int
      {
         return this.var_2297;
      }
      
      public function get slotId() : String
      {
         return this.var_1618;
      }
      
      public function get songId() : int
      {
         return this.var_2171;
      }
      
      public function get extra() : int
      {
         return this.var_1268;
      }
   }
}
