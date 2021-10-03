package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_2171:int;
      
      private var var_2172:int;
      
      private var var_2169:String;
      
      private var var_2173:String;
      
      private var var_2170:int = 0;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this.var_2171 = param1;
         this.var_2172 = param2;
         this.var_2169 = param3;
         this.var_2173 = param4;
      }
      
      public function get id() : int
      {
         return this.var_2171;
      }
      
      public function get length() : int
      {
         return this.var_2172;
      }
      
      public function get name() : String
      {
         return this.var_2169;
      }
      
      public function get creator() : String
      {
         return this.var_2173;
      }
      
      public function get startPlayHeadPos() : int
      {
         return this.var_2170;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         this.var_2170 = param1;
      }
   }
}
