package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1298:Boolean;
      
      private var var_1050:Boolean;
      
      private var var_1297:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return this.var_1298;
      }
      
      public function get hasChangedName() : Boolean
      {
         return this.var_1050;
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return this.var_1297;
      }
      
      public function flush() : Boolean
      {
         this.var_1298 = false;
         this.var_1050 = false;
         this.var_1297 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1298 = param1.readBoolean();
         this.var_1050 = param1.readBoolean();
         this.var_1297 = param1.readBoolean();
         return true;
      }
   }
}
