package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_584:int = 1;
      
      public static const const_621:int = 2;
      
      public static const const_724:int = 3;
      
      public static const const_1058:int = 4;
      
      public static const const_702:int = 5;
      
      public static const const_1053:int = 6;
       
      
      private var _type:int;
      
      private var var_1147:int;
      
      private var var_2036:String;
      
      private var var_2303:String;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this._type = param1;
         this.var_1147 = param2;
         this.var_2036 = param3;
         this.var_2303 = param4;
      }
      
      public function get messageText() : String
      {
         return this.var_2036;
      }
      
      public function get time() : String
      {
         return this.var_2303;
      }
      
      public function get senderId() : int
      {
         return this.var_1147;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
