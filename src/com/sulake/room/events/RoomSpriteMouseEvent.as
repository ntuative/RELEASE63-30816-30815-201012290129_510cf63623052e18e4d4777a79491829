package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var _type:String = "";
      
      private var var_1467:String = "";
      
      private var var_1535:String = "";
      
      private var var_2416:String = "";
      
      private var var_2415:Number = 0;
      
      private var var_2414:Number = 0;
      
      private var var_2376:Number = 0;
      
      private var var_2379:Number = 0;
      
      private var var_2016:Boolean = false;
      
      private var var_2015:Boolean = false;
      
      private var var_2014:Boolean = false;
      
      private var var_2013:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:String, param5:Number, param6:Number, param7:Number = 0, param8:Number = 0, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false)
      {
         super();
         this._type = param1;
         this.var_1467 = param2;
         this.var_1535 = param3;
         this.var_2416 = param4;
         this.var_2415 = param5;
         this.var_2414 = param6;
         this.var_2376 = param7;
         this.var_2379 = param8;
         this.var_2016 = param9;
         this.var_2015 = param10;
         this.var_2014 = param11;
         this.var_2013 = param12;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get eventId() : String
      {
         return this.var_1467;
      }
      
      public function get canvasId() : String
      {
         return this.var_1535;
      }
      
      public function get spriteTag() : String
      {
         return this.var_2416;
      }
      
      public function get screenX() : Number
      {
         return this.var_2415;
      }
      
      public function get screenY() : Number
      {
         return this.var_2414;
      }
      
      public function get localX() : Number
      {
         return this.var_2376;
      }
      
      public function get localY() : Number
      {
         return this.var_2379;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2016;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2015;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2014;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2013;
      }
   }
}
