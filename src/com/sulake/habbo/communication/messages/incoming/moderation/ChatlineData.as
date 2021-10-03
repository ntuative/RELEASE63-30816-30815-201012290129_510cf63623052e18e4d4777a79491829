package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_2520:int;
      
      private var var_2518:int;
      
      private var var_2517:int;
      
      private var var_2519:String;
      
      private var var_1745:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2520 = param1.readInteger();
         this.var_2518 = param1.readInteger();
         this.var_2517 = param1.readInteger();
         this.var_2519 = param1.readString();
         this.var_1745 = param1.readString();
      }
      
      public function get hour() : int
      {
         return this.var_2520;
      }
      
      public function get minute() : int
      {
         return this.var_2518;
      }
      
      public function get chatterId() : int
      {
         return this.var_2517;
      }
      
      public function get chatterName() : String
      {
         return this.var_2519;
      }
      
      public function get msg() : String
      {
         return this.var_1745;
      }
   }
}
