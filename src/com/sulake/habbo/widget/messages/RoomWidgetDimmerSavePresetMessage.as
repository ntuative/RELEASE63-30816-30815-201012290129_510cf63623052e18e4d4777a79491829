package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_815:String = "RWSDPM_SAVE_PRESET";
       
      
      private var var_2071:int;
      
      private var var_2068:int;
      
      private var _color:uint;
      
      private var var_970:int;
      
      private var var_2630:Boolean;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_815);
         this.var_2071 = param1;
         this.var_2068 = param2;
         this._color = param3;
         this.var_970 = param4;
         this.var_2630 = param5;
      }
      
      public function get presetNumber() : int
      {
         return this.var_2071;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_2068;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : int
      {
         return this.var_970;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2630;
      }
   }
}
