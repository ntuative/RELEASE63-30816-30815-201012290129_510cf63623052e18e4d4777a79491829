package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_1468:int;
      
      private var var_2384:String;
      
      private var var_1413:int;
      
      private var var_561:String;
      
      private var var_1416:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1468 = param1.readInteger();
         this.var_2384 = param1.readString();
         this.var_1413 = param1.readInteger();
         this.var_561 = param1.readString();
         this.var_1416 = param1.readInteger();
         return true;
      }
      
      public function get petId() : int
      {
         return this.var_1468;
      }
      
      public function get petName() : String
      {
         return this.var_2384;
      }
      
      public function get level() : int
      {
         return this.var_1413;
      }
      
      public function get figure() : String
      {
         return this.var_561;
      }
      
      public function get petType() : int
      {
         return this.var_1416;
      }
   }
}
