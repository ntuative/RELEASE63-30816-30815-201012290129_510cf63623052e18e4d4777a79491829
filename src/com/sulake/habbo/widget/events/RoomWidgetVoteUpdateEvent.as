package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_116:String = "RWPUE_VOTE_QUESTION";
      
      public static const const_121:String = "RWPUE_VOTE_RESULT";
       
      
      private var var_1044:String;
      
      private var var_1396:Array;
      
      private var var_1015:Array;
      
      private var var_1796:int;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         this.var_1044 = param2;
         this.var_1396 = param3;
         this.var_1015 = param4;
         if(this.var_1015 == null)
         {
            this.var_1015 = [];
         }
         this.var_1796 = param5;
      }
      
      public function get question() : String
      {
         return this.var_1044;
      }
      
      public function get choices() : Array
      {
         return this.var_1396.slice();
      }
      
      public function get votes() : Array
      {
         return this.var_1015.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_1796;
      }
   }
}
