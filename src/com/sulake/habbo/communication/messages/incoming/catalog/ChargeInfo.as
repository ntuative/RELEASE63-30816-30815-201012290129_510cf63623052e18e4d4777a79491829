package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChargeInfo
   {
       
      
      private var var_2418:int;
      
      private var var_2417:int;
      
      private var var_1133:int;
      
      private var var_1132:int;
      
      private var var_1771:int;
      
      private var var_2419:int;
      
      public function ChargeInfo(param1:IMessageDataWrapper)
      {
         super();
         this.var_2418 = param1.readInteger();
         this.var_2417 = param1.readInteger();
         this.var_1133 = param1.readInteger();
         this.var_1132 = param1.readInteger();
         this.var_1771 = param1.readInteger();
         this.var_2419 = param1.readInteger();
      }
      
      public function get stuffId() : int
      {
         return this.var_2418;
      }
      
      public function get charges() : int
      {
         return this.var_2417;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1133;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1132;
      }
      
      public function get chargePatchSize() : int
      {
         return this.var_2419;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1771;
      }
   }
}
