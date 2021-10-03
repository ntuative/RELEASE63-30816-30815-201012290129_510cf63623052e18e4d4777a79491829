package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_1661:int;
      
      private var var_2362:String;
      
      private var var_355:Boolean;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         this.var_1661 = param1.readInteger();
         this.var_2362 = param1.readString();
         this.var_355 = param1.readBoolean();
      }
      
      public function get nodeId() : int
      {
         return this.var_1661;
      }
      
      public function get nodeName() : String
      {
         return this.var_2362;
      }
      
      public function get visible() : Boolean
      {
         return this.var_355;
      }
   }
}
