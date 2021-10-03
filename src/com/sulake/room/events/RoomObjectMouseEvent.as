package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_214:String = "ROE_MOUSE_CLICK";
      
      public static const const_1633:String = "ROE_MOUSE_ENTER";
      
      public static const const_472:String = "ROE_MOUSE_MOVE";
      
      public static const const_1635:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1760:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_454:String = "ROE_MOUSE_DOWN";
       
      
      private var var_1467:String = "";
      
      private var var_2015:Boolean;
      
      private var var_2016:Boolean;
      
      private var var_2014:Boolean;
      
      private var var_2013:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:String, param3:int, param4:String, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false)
      {
         super(param1,param3,param4,param9,param10);
         this.var_1467 = param2;
         this.var_2015 = param5;
         this.var_2016 = param6;
         this.var_2014 = param7;
         this.var_2013 = param8;
      }
      
      public function get eventId() : String
      {
         return this.var_1467;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2015;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2016;
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
