package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionPresentEvent extends RoomSessionEvent
   {
      
      public static const const_271:String = "RSPE_PRESENT_OPENED";
       
      
      private var var_1839:int = 0;
      
      private var var_1408:String = "";
      
      public function RoomSessionPresentEvent(param1:String, param2:IRoomSession, param3:int, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(param1,param2,param5,param6);
         this.var_1839 = param3;
         this.var_1408 = param4;
      }
      
      public function get classId() : int
      {
         return this.var_1839;
      }
      
      public function get itemType() : String
      {
         return this.var_1408;
      }
   }
}
