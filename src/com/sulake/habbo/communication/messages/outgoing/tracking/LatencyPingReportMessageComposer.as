package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LatencyPingReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_2542:int;
      
      private var var_2540:int;
      
      private var var_2541:int;
      
      public function LatencyPingReportMessageComposer(param1:int, param2:int, param3:int)
      {
         super();
         this.var_2542 = param1;
         this.var_2540 = param2;
         this.var_2541 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2542,this.var_2540,this.var_2541];
      }
      
      public function dispose() : void
      {
      }
   }
}
