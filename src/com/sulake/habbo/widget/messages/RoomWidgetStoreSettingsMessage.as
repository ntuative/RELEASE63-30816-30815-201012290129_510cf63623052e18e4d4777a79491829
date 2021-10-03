package com.sulake.habbo.widget.messages
{
   public class RoomWidgetStoreSettingsMessage extends RoomWidgetMessage
   {
      
      public static const const_1446:String = "RWSSM_STORE_SETTINGS";
      
      public static const const_764:String = "RWSSM_STORE_SOUND";
      
      public static const const_627:String = "RWSSM_PREVIEW_SOUND";
       
      
      private var var_454:Number;
      
      public function RoomWidgetStoreSettingsMessage(param1:String)
      {
         super(param1);
      }
      
      public function get volume() : Number
      {
         return this.var_454;
      }
      
      public function set volume(param1:Number) : void
      {
         this.var_454 = param1;
      }
   }
}
