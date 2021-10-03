package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1292:Boolean;
      
      private var var_2326:int;
      
      private var var_1696:int;
      
      private var var_1697:int;
      
      private var var_2329:int;
      
      private var var_2327:int;
      
      private var var_2328:int;
      
      private var var_2243:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1292;
      }
      
      public function get commission() : int
      {
         return this.var_2326;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1696;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1697;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2327;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2329;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2328;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2243;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1292 = param1.readBoolean();
         this.var_2326 = param1.readInteger();
         this.var_1696 = param1.readInteger();
         this.var_1697 = param1.readInteger();
         this.var_2327 = param1.readInteger();
         this.var_2329 = param1.readInteger();
         this.var_2328 = param1.readInteger();
         this.var_2243 = param1.readInteger();
         return true;
      }
   }
}
