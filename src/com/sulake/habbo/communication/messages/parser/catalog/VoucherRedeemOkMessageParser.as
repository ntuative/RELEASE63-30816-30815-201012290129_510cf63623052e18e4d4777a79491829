package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoucherRedeemOkMessageParser implements IMessageParser
   {
       
      
      private var var_886:String = "";
      
      private var var_1100:String = "";
      
      public function VoucherRedeemOkMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_1100 = "";
         this.var_886 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1100 = param1.readString();
         this.var_886 = param1.readString();
         return true;
      }
      
      public function get productName() : String
      {
         return this.var_886;
      }
      
      public function get productDescription() : String
      {
         return this.var_1100;
      }
   }
}
