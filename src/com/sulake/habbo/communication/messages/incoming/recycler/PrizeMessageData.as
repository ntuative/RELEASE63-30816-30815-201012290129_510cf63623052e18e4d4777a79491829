package com.sulake.habbo.communication.messages.incoming.recycler
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PrizeMessageData
   {
       
      
      private var var_2053:String;
      
      private var var_1699:int;
      
      public function PrizeMessageData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2053 = param1.readString();
         this.var_1699 = param1.readInteger();
      }
      
      public function get productItemType() : String
      {
         return this.var_2053;
      }
      
      public function get productItemTypeId() : int
      {
         return this.var_1699;
      }
   }
}
