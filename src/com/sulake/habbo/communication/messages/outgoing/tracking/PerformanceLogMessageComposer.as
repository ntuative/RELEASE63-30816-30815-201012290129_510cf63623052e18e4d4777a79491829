package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_2136:int = 0;
      
      private var var_1279:String = "";
      
      private var var_1596:String = "";
      
      private var var_2198:String = "";
      
      private var var_2539:String = "";
      
      private var var_1804:int = 0;
      
      private var var_2536:int = 0;
      
      private var var_2538:int = 0;
      
      private var var_1282:int = 0;
      
      private var var_2537:int = 0;
      
      private var var_1281:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2136 = param1;
         this.var_1279 = param2;
         this.var_1596 = param3;
         this.var_2198 = param4;
         this.var_2539 = param5;
         if(param6)
         {
            this.var_1804 = 1;
         }
         else
         {
            this.var_1804 = 0;
         }
         this.var_2536 = param7;
         this.var_2538 = param8;
         this.var_1282 = param9;
         this.var_2537 = param10;
         this.var_1281 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2136,this.var_1279,this.var_1596,this.var_2198,this.var_2539,this.var_1804,this.var_2536,this.var_2538,this.var_1282,this.var_2537,this.var_1281];
      }
   }
}
