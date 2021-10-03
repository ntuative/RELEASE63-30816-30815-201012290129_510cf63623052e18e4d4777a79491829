package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_1618:int;
      
      private var var_2101:String;
      
      private var var_849:String;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1618 = param1.readInteger();
         this.var_2101 = param1.readString();
         this.var_849 = param1.readString();
      }
      
      public function get slotId() : int
      {
         return this.var_1618;
      }
      
      public function get figureString() : String
      {
         return this.var_2101;
      }
      
      public function get gender() : String
      {
         return this.var_849;
      }
   }
}
