package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1527:int;
      
      private var var_1547:int;
      
      private var var_1548:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1547 = param1.readInteger();
         this.var_1527 = param1.readInteger();
         this.var_1548 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         this.var_1527 = 0;
         this.var_1547 = 0;
         this.var_1548 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return this.var_1527;
      }
      
      public function get messageId() : int
      {
         return this.var_1547;
      }
      
      public function get timestamp() : String
      {
         return this.var_1548;
      }
   }
}
