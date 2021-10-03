package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2288:int;
      
      private var var_1512:String;
      
      private var var_2050:String;
      
      private var var_2387:Boolean;
      
      private var var_2389:Boolean;
      
      private var var_2388:int;
      
      private var var_2051:String;
      
      private var var_2390:String;
      
      private var var_1510:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2288 = param1.readInteger();
         this.var_1512 = param1.readString();
         this.var_2050 = param1.readString();
         this.var_2387 = param1.readBoolean();
         this.var_2389 = param1.readBoolean();
         param1.readString();
         this.var_2388 = param1.readInteger();
         this.var_2051 = param1.readString();
         this.var_2390 = param1.readString();
         this.var_1510 = param1.readString();
      }
      
      public function get avatarId() : int
      {
         return this.var_2288;
      }
      
      public function get avatarName() : String
      {
         return this.var_1512;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2050;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2387;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2389;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2388;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2051;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2390;
      }
      
      public function get realName() : String
      {
         return this.var_1510;
      }
   }
}
