package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_561:String;
      
      private var var_925:String;
      
      private var var_2058:String;
      
      private var var_1510:String;
      
      private var var_2057:int;
      
      private var var_2055:String;
      
      private var var_2059:int;
      
      private var var_2056:int;
      
      private var var_2054:int;
      
      private var _respectLeft:int;
      
      private var var_742:int;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_561 = param1.readString();
         this.var_925 = param1.readString();
         this.var_2058 = param1.readString();
         this.var_1510 = param1.readString();
         this.var_2057 = param1.readInteger();
         this.var_2055 = param1.readString();
         this.var_2059 = param1.readInteger();
         this.var_2056 = param1.readInteger();
         this.var_2054 = param1.readInteger();
         this._respectLeft = param1.readInteger();
         this.var_742 = param1.readInteger();
         return true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this.var_561;
      }
      
      public function get sex() : String
      {
         return this.var_925;
      }
      
      public function get customData() : String
      {
         return this.var_2058;
      }
      
      public function get realName() : String
      {
         return this.var_1510;
      }
      
      public function get tickets() : int
      {
         return this.var_2057;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2055;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2059;
      }
      
      public function get directMail() : int
      {
         return this.var_2056;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2054;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_742;
      }
   }
}
