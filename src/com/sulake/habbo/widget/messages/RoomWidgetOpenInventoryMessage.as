package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_810:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_927:String = "inventory_effects";
      
      public static const const_932:String = "inventory_badges";
      
      public static const const_1292:String = "inventory_clothes";
      
      public static const const_1326:String = "inventory_furniture";
       
      
      private var var_2357:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_810);
         this.var_2357 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2357;
      }
   }
}
