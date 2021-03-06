package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_161:Number = 0;
      
      private var var_160:Number = 0;
      
      private var var_2091:Number = 0;
      
      private var var_2090:Number = 0;
      
      private var var_2088:Number = 0;
      
      private var var_2092:Number = 0;
      
      private var var_239:int = 0;
      
      private var var_2087:int = 0;
      
      private var var_292:Array;
      
      private var var_2089:Boolean = false;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         this.var_292 = [];
         super();
         this._id = param1;
         this._x = param2;
         this.var_161 = param3;
         this.var_160 = param4;
         this.var_2091 = param5;
         this.var_239 = param6;
         this.var_2087 = param7;
         this.var_2090 = param8;
         this.var_2088 = param9;
         this.var_2092 = param10;
         this.var_2089 = param11;
         this.var_292 = param12;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_161;
      }
      
      public function get z() : Number
      {
         return this.var_160;
      }
      
      public function get localZ() : Number
      {
         return this.var_2091;
      }
      
      public function get targetX() : Number
      {
         return this.var_2090;
      }
      
      public function get targetY() : Number
      {
         return this.var_2088;
      }
      
      public function get targetZ() : Number
      {
         return this.var_2092;
      }
      
      public function get dir() : int
      {
         return this.var_239;
      }
      
      public function get dirHead() : int
      {
         return this.var_2087;
      }
      
      public function get isMoving() : Boolean
      {
         return this.var_2089;
      }
      
      public function get actions() : Array
      {
         return this.var_292.slice();
      }
   }
}
